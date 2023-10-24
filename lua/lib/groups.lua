---@class ComponentNvim.Pairing
---@field label string
---@field recognition_pattern string
---@field extensions string[]

---@class ComponentNvim.Project
---@field root_folder string
---@field pairings ComponentNvim.Pairing[]
--
local M = {
  config = {
    ---@type ComponentNvim.Project[]
    projects = {
      {
        root_folder = "bc-desktop-client",
        pairings = {
          {
            label = "Components",
            recognition_pattern = "src/*/**/*components/**/*.tsx",
            extensions = { "tsx", "scss", "story.tsx" },
          },
          {
            label = "Libs",
            recognition_pattern = "src/*/**/*libs/**/*.ts",
            extensions = { "ts", "spec.ts" },
          },
        },
      },
    },
  },
}

local function close_all_windows_except_current()
  vim.cmd("Neotree close")

  local current_win = vim.api.nvim_get_current_win()
  local all_wins = vim.api.nvim_tabpage_list_wins(0)

  for _, win in ipairs(all_wins) do
    if win ~= current_win then
      vim.api.nvim_win_close(win, true)
    end
  end
end

---@param str string
local function trim_newline(str)
  return str:gsub("\n", "")
end

---Get the current project configuration based on the project path.
---@return table | nil
local function get_current_project_config()
  local current_working_dir = vim.fn.system("git rev-parse --show-toplevel")

  if current_working_dir == "" then
    print("No git repository found")
    return nil
  end

  local project_folder = vim.fn.fnamemodify(trim_newline(current_working_dir), ":t")

  for _, config in ipairs(M.config.projects) do
    if config.root_folder == project_folder then
      return config
    end
  end

  print("No matching project config found")
  return nil
end

---@param extension string
---@param name string
local function find_files_by_extension_and_name(extension, name)
  local filePath = vim.fn.system(string.format("rg --files --hidden --glob '%s.%s'", name, extension))
  return trim_newline(filePath)
end

---@param component_name string
---@param extensions string[]
local function open_files_by_type(component_name, extensions)
  local all_wins
  local first_file = true -- To keep track of the first file

  for _, ext in ipairs(extensions) do
    local file_path = find_files_by_extension_and_name(ext, component_name)

    if file_path ~= "" then
      if first_file then -- Open first file with edit
        vim.cmd(string.format("edit %s", file_path))
        first_file = false
      else
        vim.cmd(string.format("vsplit %s", file_path))
      end
    end

    all_wins = vim.api.nvim_tabpage_list_wins(0)
  end

  -- Focus the first window
  if #all_wins > 0 then
    vim.api.nvim_set_current_win(all_wins[1])
  end
end

---@param pairing ComponentNvim.Pairing
local function find_items(pairing)
  local rg_string = string.format("rg --files --hidden -g '%s'", pairing.recognition_pattern)
  local rg_output = vim.fn.system(rg_string)

  local files = vim.split(rg_output, "\n")
  local unique_items = {}

  local recognition_pattern = pairing.recognition_pattern:match("[^.]+$")

  for _, file in ipairs(files) do
    local pattern = string.format(".+/([^/.]+)%%.%s$", recognition_pattern)
    local item = file:match(pattern)
    if item then
      unique_items[item] = true
    end
  end

  local item_names = {}
  for name, _ in pairs(unique_items) do
    table.insert(item_names, name)
  end

  table.sort(item_names)
  return item_names
end

function M.find_and_open_files()
  vim.cmd("Neotree close")

  local project_config = get_current_project_config()

  if not project_config then
    return
  end

  local pairing_labels = {}
  for _, pairing in ipairs(project_config.pairings) do
    table.insert(pairing_labels, pairing.label)
  end

  vim.ui.select(pairing_labels, { prompt = "Select a pairing:" }, function(selected_pairing_label)
    local selected_pairing = nil

    for _, pairing in ipairs(project_config.pairings) do
      if pairing.label == selected_pairing_label then
        selected_pairing = pairing
        break
      end
    end

    if not selected_pairing then
      print("Invalid pairing selected")
      return
    end

    local item_names = find_items(selected_pairing)

    if #item_names == 0 then
      print("No items found")
      return
    end

    vim.ui.select(item_names, { prompt = "Select an item:" }, function(selected_item)
      if selected_item then
        vim.ui.select({ "No", "Yes" }, { prompt = "Open in new tab?" }, function(selected)
          if selected == "Yes" then
            vim.cmd.tabnew()
            open_files_by_type(selected_item, selected_pairing.extensions)
          else
            close_all_windows_except_current()
            open_files_by_type(selected_item, selected_pairing.extensions)
          end
        end)
      end
    end)
  end)
end

---Find and open a component file under the cursor in a new tab.
function M.find_and_open_component_file()
  local current_config = get_current_project_config()
  if not current_config then
    print("No project config found")
    return
  end

  local component_name = vim.fn.expand("<cword>")
  if not component_name then
    print("No component name found")
    return
  end

  for _, ext in ipairs(current_config.component_extensions) do
    local path = find_files_by_extension_and_name(ext, component_name)
    if path ~= "" then
      vim.ui.select({ "No", "Yes" }, { prompt = "Open in new tab?" }, function(selected)
        if selected == "Yes" then
          vim.cmd.tabnew()
          open_files_by_type(component_name, current_config.component_extensions)
        else
          close_all_windows_except_current()
          open_files_by_type(selected_item, selected_pairing.extensions)
        end
      end)

      return
    end
  end

  print("No component found for " .. component_name)
end

return M
