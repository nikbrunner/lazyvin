local Util = require("lazyvim.util")
local map = vim.keymap.set

map("n", "vv", "^v$", { desc = "Select Line" })
map("n", "vA", "ggVG", { desc = "Select All" })
map("n", "yA", "ggVGy", { desc = "Copy All" })

-- LazyVin Group
map("n", "<leader>l", "<nop>", { desc = WhichKeyIgnoreLabel })
map("n", "<leader>lm", "<cmd>Mason<CR>", { desc = "Package Manager - [Mason]" })
map("n", "<leader>ln", "<cmd>NullLsInfo<CR>", { desc = "Tool Manager - [NullLS]" })
map("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Plugin Manager - [Lazy]" })
map("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
