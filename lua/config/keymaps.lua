local lib = require("lib")
local lazyVimUtil = require("lazyvim.util")

local set = vim.keymap.set
local del = vim.keymap.del

set({ "n", "v" }, "H", "^", { desc = "Move to Start of Line" })
set({ "n", "v" }, "L", "$", { desc = "Move to End of Line" })

set({ "n", "v" }, "<leader><CR>", vim.cmd.wa, { desc = "Save" })

set("n", "<S-Tab>", vim.cmd.tabprevious, { desc = "Previous Buffer" })
set("n", "<Tab>", vim.cmd.tabnext, { desc = "Next Buffer" })

set("n", "vv", "^v$", { desc = "Select Line" })
set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

set("n", "<leader>d", '"_d', { desc = "Delete" })
set("n", "x", '"_x', { desc = "Delete" })

set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic" })

-- Vin Group
-- Delete LazyVim default bindings for meta information
del("n", "<leader>l")
del("n", "<leader>L")

set("n", "<leader>vm", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>vn", "<cmd>NullLsInfo<CR>", { desc = "Tool Manager - [NullLS]" })
set("n", "<leader>vl", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [Lazy]" })
set("n", "<leader>vi", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>vc", lazyVimUtil.changelog, { desc = "LazyVim Changelog" })
set("n", "<leader>vM", vim.cmd.messages, { desc = "Display messages" })

-- Find component
set("n", "<leader>fC", lib.find.find_and_open_component_files, { desc = "Find component" })

-- Overwrite Redraw command
set("n", "<leader>ur", vim.cmd.e, { desc = "Redraw" })

-- Copy Group
set("n", "<leader>ccf", lib.copy.fullPath, { desc = "Full Path" })
set("n", "<leader>ccr", lib.copy.relativePath, { desc = "Relative Path" })
set("n", "<leader>ccn", lib.copy.fileName, { desc = "File Name" })

-- Log Group
set("n", "<leader>cll", lib.edit.log_symbol, { desc = "Auto Log Symbol" })
set("n", "<leader>cld", lib.edit.delete_logs, { desc = "Auto Log Symbol" })

-- Custom Replace with Spectre
set("v", "<leader>sr", function()
  local function get_visual_selection()
    vim.cmd('noau normal! "vy"')

    return vim.fn.getreg("v")
  end

  require("spectre").open({
    search_text = get_visual_selection(),
  })
end, {
  desc = "Replace current selection",
})

-- Tabs
set("n", "<leader><tab>o", vim.cmd.tabonly, { desc = "Close All Other Tabs" })
set("n", "<leader><tab>1", "1gt", { desc = "Go to Tab 1" })
set("n", "<leader><tab>2", "2gt", { desc = "Go to Tab 2" })
set("n", "<leader><tab>3", "3gt", { desc = "Go to Tab 3" })
set("n", "<leader><tab>4", "4gt", { desc = "Go to Tab 4" })
set("n", "<leader><tab>5", "5gt", { desc = "Go to Tab 5" })
set("n", "<leader><tab>6", "6gt", { desc = "Go to Tab 6" })
set("n", "<leader><tab>7", "7gt", { desc = "Go to Tab 7" })
set("n", "<leader><tab>8", "8gt", { desc = "Go to Tab 8" })
set("n", "<leader><tab>9", "9gt", { desc = "Go to Tab 9" })

-- Make lazygit open in a fullscreen floating window
set("n", "<leader>gg", function()
  lazyVimUtil.float_term(
    { "lazygit" },
    { cwd = lazyVimUtil.get_root(), esc_esc = false, ctrl_hjkl = false, size = { width = 1, height = 1 } }
  )
end, { desc = "Lazygit (root dir)" })

-- NOTE: This breaks when i try to map it via lazy.nvim
set("n", "<leader><tab>r", function()
  vim.ui.input({ prompt = "New Tab Name: " }, function(new_name)
    vim.cmd("TabRename " .. new_name)
  end)
end, { desc = "Rename Tab" })

set("n", "<leader>an", lib.tmux.start_smug_session, { desc = "New Preconfigured Session" })
set("n", "<leader>ac", lib.tmux.start_custom_tmux_session, { desc = "Create Custom TMUX Session" })
set("n", "<leader>as", lib.tmux.switch_tmux_session, { desc = "Switch Session" })
set("n", "<leader>aw", lib.tmux.switch_tmux_window, { desc = "Switch Windows" })
set("n", "<leader>ak", lib.tmux.kill_tmux_session, { desc = "Kill tmux active session" })
