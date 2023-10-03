local M = {
  config = {
    project_path = "$HOME/Documents/dev/repos/dcd/bc-desktop-client",
    search_configs = {
      {
        name = "Component",
        relative_base_path = "src/client/commons/components/",
        extensions = { "tsx", "scss", "story.tsx" },
      },
      {
        name = "Lib",
        relative_base_path = { "src/commons/libs", "src/client/kiosk/libs" },
        extensions = { "ts", "spec.ts" },
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

function M.find_and_open_component_files()
  local function find_components()
    local rg_output = vim.fn.system("rg --files --hidden | grep '/components/.*\\.tsx$'")
    local files = vim.split(rg_output, "\n")

    local unique_components = {}
    for _, file in ipairs(files) do
      -- Get the component name from the file path
      local component = file:match(".+/([^/]+)%.tsx")

      if component and not unique_components[component] then
        -- Skip .story.tsx files
        if not component:find("story") then
          unique_components[component] = true
        end
      end
    end

    local component_names = {}
    for name, _ in pairs(unique_components) do
      table.insert(component_names, name)
    end

    table.sort(component_names)

    return component_names
  end

  -- Get the component name from the user
  vim.ui.select(find_components(), { prompt = "Select a component:" }, function(selected_component, _)
    if not selected_component then
      return
    end

    -- Define the search paths based on the component name
    local tsx_file = string.format("%s.tsx", selected_component)
    local scss_file = string.format("%s.scss", selected_component)
    local story_file = string.format("%s.story.tsx", selected_component)

    -- Search for the files and get the full paths
    local tsx_path = vim.fn.system(string.format("rg --files --hidden --glob '%s'", tsx_file))
    local scss_path = vim.fn.system(string.format("rg --files --hidden --glob '%s'", scss_file))
    local story_path = vim.fn.system(string.format("rg --files --hidden --glob '%s'", story_file))

    -- Trim the newlines at the end of each path
    tsx_path = tsx_path:gsub("\n", "")
    scss_path = scss_path:gsub("\n", "")
    story_path = story_path:gsub("\n", "")

    -- Close all other windows in the current tab.
    close_all_windows_except_current()

    -- Open the files if they exist
    if tsx_path ~= "" then
      vim.cmd("edit " .. tsx_path)
    end

    if scss_path ~= "" then
      vim.cmd("vsplit " .. scss_path)
    end

    if story_path ~= "" then
      vim.cmd("vsplit " .. story_path)
    end

    -- Get a list of all windows in the current tabpage
    local all_wins = vim.api.nvim_tabpage_list_wins(0)

    -- Focus the left-most window (which should be the first in the list)
    if #all_wins > 0 then
      vim.api.nvim_set_current_win(all_wins[1])
    end
  end)
end

return M
