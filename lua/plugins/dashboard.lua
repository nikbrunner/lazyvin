---@type LazySpec
local dashboard_spec = {
  "nvimdev/dashboard-nvim",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  event = "VimEnter",
  opts = {
    theme = "hyper",
    change_to_vcs_root = true,
    config = {
      header = {
        "",
        "",
        "",
        "",
        "██       █████  ███████ ██    ██ ██    ██ ██ ███    ██",
        "██      ██   ██    ███   ██  ██  ██    ██ ██ ████   ██",
        "██      ███████   ███     ████   ██    ██ ██ ██ ██  ██",
        "██      ██   ██  ███       ██     ██  ██  ██ ██  ██ ██",
        "███████ ██   ██ ███████    ██      ████   ██ ██   ████",
        "",
        "",
        "",
      },
      footer = {
        "",
        "",
        "",
        "Fly with me  ",
      },
      shortcut = {
        {
          icon = " ",
          icon_hl = "@variable",
          desc = "Plugin Manager (Lazy) ",
          action = "Lazy",
          key = "l",
        },
        {
          icon = " ",
          icon_hl = "@variable",
          desc = "Package Manager (Mason) ",
          action = "Mason",
          key = "m",
        },
        {
          icon = " ",
          icon_hl = "@macro",
          desc = "Quit ",
          action = "qa!",
          key = "q",
        },
      },
    },
  },
  config = function(_, opts)
    require("dashboard").setup(opts)
  end,
}

-- disable alpha
local alpha_spec = { "goolord/alpha-nvim", enabled = false }

return {
  dashboard_spec,
  alpha_spec,
}
