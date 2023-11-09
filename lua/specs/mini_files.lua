local M = {}

M.spec = {
  "echasnovski/mini.files",
  opts = {

    mappings = {
      close = "q",
      go_in = "l",
      go_in_plus = "<CR>",
      go_out = "h",
      go_out_plus = "H",
      reset = "<BS>",
      reveal_cwd = "@",
      show_help = "g?",
      synchronize = "s",
      trim_left = "<",
      trim_right = ">",
    },

    windows = {
      width_focus = 50,
      width_nofocus = 50,
      width_preview = 50,
    },
  },
}

return M.spec
