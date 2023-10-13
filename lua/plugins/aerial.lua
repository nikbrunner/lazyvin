---@diagnostic disable: missing-fields
local M = {}

---@type LazySpec
M.spec = {
  "stevearc/aerial.nvim",
  event = "LazyFile",
  keys = {
    { "<leader>es", "<CMD>AerialToggle<CR>", desc = "Aerial (Symbols)" },
    { "gn", "<CMD>AerialNavToggle<CR>", desc = "Aerial (Go Nav)" },
  },
  opts = {
    backends = { "treesitter", "lsp", "markdown", "man" },
  },
}

return M.spec
