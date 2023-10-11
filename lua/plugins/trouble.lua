local M = {}

---@type LazySpec
M.spec = {
  "folke/trouble.nvim",
  opts = {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    win_config = { border = "rounded" }, -- window configuration for floating windows. See |nvim_open_win()|.
    auto_close = true, -- automatically close the list when you have no diagnostics
    auto_fold = true, -- automatically fold a file trouble list at creation
  },
}

return M.spec
