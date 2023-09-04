local M = {}

---@type LazySpec
M.spec = {
  "dgagn/diagflow.nvim",
  event = "LspAttach",
  opts = {},
}

return M.spec
