local lib = require("lib")
local lazyvim_util = require("lazyvim.util")

local function set(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  opts.silent = opts.silent == nil and true or opts.silent
  vim.keymap.set(mode, lhs, rhs, opts)
end
local del = vim.keymap.del

-- map ; to :
set("n", ";", ":", { desc = "Vim Command" })

del("n", "<leader>-")
del("n", "<leader>|")

set("n", "H", "^", { desc = "Move to Start of Line" })
set("n", "L", "$", { desc = "Move to End of Line" })

set("n", "vv", "^v$", { desc = "Select Line" })
set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

set({ "n", "v" }, "<leader><CR>", vim.cmd.wa, { desc = "Write All" })

set("n", "x", '"_x', { desc = "Delete" })

set("n", "J", "mzJ`z", { desc = "Join Lines" })

set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic" })

-- Vin Group
-- Delete LazyVim default bindings for meta information
del("n", "<leader>l")
del("n", "<leader>L")

set("n", "<leader>vP", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>vp", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [LazyVim]" })
set("n", "<leader>ve", "<cmd>LazyExtras<CR>", { desc = "Extras Manager - [LazyVim]" })
set("n", "<leader>vi", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>vc", lazyvim_util.news.changelog, { desc = "Changelog [LazyVim]" })
set("n", "<leader>vr", "<cmd>LspRestart<CR>", { desc = "Restart LSP Server" })
set("n", "<leader>vR", lazyvim_util.root.info, { desc = "Root Info [LazyVim]" })
set("n", "<leader>vM", vim.cmd.messages, { desc = "Display messages" })

-- Find component
set("n", "<leader>fc", lib.component.find_and_open_component_file, { desc = "Find component under cursor" })
set("n", "<leader>fC", lib.component.find_and_open_files, { desc = "Find component" })

-- Overwrite Redraw command
set("n", "<leader>ur", vim.cmd.e, { desc = "Redraw" })

-- Copy Group
set("n", "<leader>ccf", lib.copy.fullPath, { desc = "Full Path" })
set("n", "<leader>ccr", lib.copy.relativePath, { desc = "Relative Path" })
set("n", "<leader>ccn", lib.copy.fileName, { desc = "File Name" })

-- Log Group
set("n", "<leader>cll", lib.log.log_symbol, { desc = "Auto Log Symbol" })
set("n", "<leader>cld", lib.log.delete_logs, { desc = "Auto Log Symbol" })

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

-- Tab Navigation
set("n", "<Tab>", vim.cmd.tabnext, { desc = "Next Tab" })
set("n", "<S-Tab>", vim.cmd.tabprevious, { desc = "Previous Tab" })
set("n", "<leader><tab><tab>", vim.cmd.tabnew, { desc = "New Tab" })
set("n", "<leader><tab>o", vim.cmd.tabonly, { desc = "Close All Other Tabs" })
set("n", "<leader><tab>q", vim.cmd.tabclose, { desc = "Close Tab" })
set("n", "<leader><tab>1", "1gt", { desc = "Go to Tab 1" })
set("n", "<leader><tab>2", "2gt", { desc = "Go to Tab 2" })
set("n", "<leader><tab>3", "3gt", { desc = "Go to Tab 3" })
set("n", "<leader><tab>4", "4gt", { desc = "Go to Tab 4" })
set("n", "<leader><tab>5", "5gt", { desc = "Go to Tab 5" })
set("n", "<leader><tab>6", "6gt", { desc = "Go to Tab 6" })
set("n", "<leader><tab>7", "7gt", { desc = "Go to Tab 7" })
set("n", "<leader><tab>8", "8gt", { desc = "Go to Tab 8" })
set("n", "<leader><tab>9", "9gt", { desc = "Go to Tab 9" })

set("n", "<leader>gg", lib.git.startLazygit, { desc = "Lazygit" })
set("n", "<leader>gp", lib.git.startGithubDash, { desc = "GitHub Pull Requests" })

set("n", "<leader><tab>r", function()
  vim.ui.input({ prompt = "New Tab Name: " }, function(new_name)
    vim.cmd("TabRename " .. new_name)
  end)
end, { desc = "Rename Tab" })

set("n", "<leader>.n", lib.tmux.start_smug_session, { desc = "New Pre-Configured Session" })
set("n", "<leader>.c", lib.tmux.start_custom_tmux_session, { desc = "Create Custom TMUX Session" })
set("n", "<leader>.s", lib.tmux.switch_tmux_session, { desc = "Switch Session" })
set("n", "<leader>.w", lib.tmux.switch_tmux_window, { desc = "Switch Windows" })
set("n", "<leader>.q", lib.tmux.kill_tmux_session, { desc = "Quit TMUX Session" })
set("n", "<leader>..", lib.tmux.switch_nvim_instance, { desc = "Switch Neovim Instance" })

-- Center scren when using <C-u> and <C-d>
set({ "n", "i", "c" }, "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
set({ "n", "i", "c" }, "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
