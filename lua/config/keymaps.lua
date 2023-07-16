local utils = require("utils")
local lazyVimUtil = require("lazyvim.util")
local set = vim.keymap.set
local del = vim.keymap.del

set({ "n", "v" }, "H", "^", { desc = "Move to Start of Line" })
set({ "n", "v" }, "L", "$", { desc = "Move to End of Line" })

set("n", "<leader><CR>", vim.cmd.wa, { desc = "Save" })

set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })

set("n", "vv", "^v$", { desc = "Select Line" })
set("n", "vA", "ggVG", { desc = "Select All" })
set("n", "yA", "ggVGy", { desc = "Copy All" })

-- LazyVin Group
del("n", "<leader>l")
del("n", "<leader>L")

set("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
set("n", "<leader>ln", "<cmd>NullLsInfo<CR>", { desc = "Tool Manager - [NullLS]" })
set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [Lazy]" })
set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
set("n", "<leader>lc", lazyVimUtil.changelog, { desc = "LazyVim Changelog" })

-- Copy Group
set("n", "<leader>ccf", utils.copy.fullPath, { desc = "Full Path" })
set("n", "<leader>ccr", utils.copy.relativePath, { desc = "Relative Path" })
set("n", "<leader>ccn", utils.copy.fileName, { desc = "File Name" })
