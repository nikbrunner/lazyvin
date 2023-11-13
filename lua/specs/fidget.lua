local M = {}

---@type LazySpec
M.spec = {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      override_vim_notify = true, -- Automatically override vim.notify() with Fidget
    },
  },
}

return M.spec
