local M = {}

---@type LazySpec
M.spec = {
  "nanozuki/tabby.nvim",
  enabled = false,
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_tail")
  end,
}

return M.spec
