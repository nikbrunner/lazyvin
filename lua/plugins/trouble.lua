local M = {}

---@type LazySpec
M.spec = {
  "folke/trouble.nvim",
  opts = {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 15, -- height of the trouble list when position is top or bottom
    width = 100, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_fold = false, -- automatically fold a file trouble list at creation
  },
}

return M.spec
