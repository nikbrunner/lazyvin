local lib = require("lib")
local lazyVimUtil = require("lazyvim.util")
local set = vim.keymap.set
local del = vim.keymap.del

set({ "n", "v" }, "H", "^", { desc = "Move to Start of Line" })
set({ "n", "v" }, "L", "$", { desc = "Move to End of Line" })

set("n", "<leader><CR>", vim.cmd.wa, { desc = "Save" })

set("n", "<S-Tab>", vim.cmd.tabprevious, { desc = "Previous Buffer" })
set("n", "<Tab>", vim.cmd.tabnext, { desc = "Next Buffer" })

set("n", "vv", "^v$", { desc = "Select Line" })
set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

set("n", "<leader>d", '"_d', { desc = "Delete" })
set("n", "x", '"_x', { desc = "Delete" })

set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic" })

-- LazyVin Group
del("n", "<leader>l")
del("n", "<leader>L")

set("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>ln", "<cmd>NullLsInfo<CR>", { desc = "Tool Manager - [NullLS]" })
set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [Lazy]" })
set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>lc", lazyVimUtil.changelog, { desc = "LazyVim Changelog" })

-- Copy Group
set("n", "<leader>ccf", lib.copy.fullPath, { desc = "Full Path" })
set("n", "<leader>ccr", lib.copy.relativePath, { desc = "Relative Path" })
set("n", "<leader>ccn", lib.copy.fileName, { desc = "File Name" })

-- Log Group
set("n", "<leader>cll", lib.edit.log_symbol, { desc = "Auto Log Symbol" })
set("n", "<leader>cld", lib.edit.delete_logs, { desc = "Auto Log Symbol" })

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

-- NOTE: This breaks when i try to map it via lazy.nvim
set("n", "<leader><tab>r", function()
  vim.ui.input({ prompt = "New Tab Name: " }, function(new_name)
    vim.cmd("TabRename " .. new_name)
  end)
end, { desc = "Rename Tab" })
