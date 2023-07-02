local Util = require("lazyvim.util")
local map = vim.keymap.set

map("n", "H", "^", { desc = "Move to Start of Line" })
map("n", "L", "$", { desc = "Move to End of Line" })

map("n", "vv", "^v$", { desc = "Select Line" })
map("n", "vA", "ggVG", { desc = "Select All" })
map("n", "yA", "ggVGy", { desc = "Copy All" })

-- Terminal
local term_style = {
  border = "single",
  style = "minimal",
}
map("n", "<leader>gg", function()
  Util.float_term(
    { "lazygit" },
    vim.tbl_extend("force", term_style, {
      -- Make lazygit window full screen
      size = {
        width = 1,
        height = 1,
      },
    })
  )
end, { desc = "Lazygit (cwd)" })

local lazyterm = function()
  Util.float_term(nil, vim.tbl_extend("force", term_style, { cwd = Util.get_root() }))
end

map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
