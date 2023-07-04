local Util = require("lazyvim.util")
local map = vim.keymap.set

map("n", "H", "^", { desc = "Move to Start of Line" })
map("n", "L", "$", { desc = "Move to End of Line" })

map("n", "vv", "^v$", { desc = "Select Line" })
map("n", "vA", "ggVG", { desc = "Select All" })
map("n", "yA", "ggVGy", { desc = "Copy All" })
