local M = {}

---@type LazySpec
M.spec = {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  keys = {
    {
      id = "no-neck-pain",
      "<leader>wz",
      "<cmd>NoNeckPain<CR>",
    },
  },
}

return M.spec
