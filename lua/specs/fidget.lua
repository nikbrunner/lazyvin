local M = {}

---@type LazySpec
M.spec = {
  "j-hui/fidget.nvim",
  opts = {
    progress = {
      poll_rate = 1, -- How frequently to poll for progress messages
      ignore_done_already = true, -- Ignore new tasks that are already complete
      suppress_on_insert = true, -- Suppress new messages while in insert mode
    },
    notification = {
      poll_rate = 1, -- How frequently to poll and render notifications
      override_vim_notify = true, -- Automatically override vim.notify() with Fidget
    },
  },
}

return M.spec
