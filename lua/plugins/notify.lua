local M = {}

M.spec = {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 3000,
    on_open = function(win)
      vim.api.nvim_win_set_option(win, "winblend", 30)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
  },
}

return M.spec
