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

-- NOTE: This breaks when i try to map it via lazy.nvim
set("n", "<leader><tab>r", function()
  vim.ui.input({ prompt = "New Tab Name: " }, function(new_name)
    vim.cmd("TabRename " .. new_name)
  end)
end, { desc = "Rename Tab" })
