local M = {}

M.specs = {
  {
    "terra-theme/terra-core.nvim",

    dev = true,
    lazy = false,
    priority = 1000,

    keys = {
      {
        "<leader>lTt",
        function()
          require("terra-core.actions.config").select_theme()
        end,
        desc = "Select theme",
      },
    },

    ---@type TerraConfig
    opts = {
      theme = "summer",
      variant = "night",
      diagnostics = {
        background = true,
      },
    },
  },

  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "wave",
      colors = {
        theme = {
          all = {
            ui = {
              -- Remove the background from the gutter
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Modern Telescope
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

          -- Dark Completion Menu
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          -- NeoTree
          NeoTreeTitleBar = { fg = theme.ui.special, bg = theme.ui.bg_p1, bold = true },
          NeoTreeNormal = { bg = theme.ui.bg_dim },
          NeoTreeNormalNC = { bg = theme.ui.bg_dim },
          NeoTreeFloatNormal = { bg = theme.ui.bg_dim },
          NeoTreeFloatBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        }
      end,
    },
  },
}

return M.specs
