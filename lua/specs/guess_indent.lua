local M = {}

---@type LazySpec
M.spec = {
  "nmac427/guess-indent.nvim",
  config = function()
    require("guess-indent").setup({})
  end,
}

return M.spec
