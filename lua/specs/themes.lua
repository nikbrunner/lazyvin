---@diagnostic disable: missing-fields
local M = {}

M.specs = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
    },
  },

  {
    "terra-theme/terra-core.nvim",
    dev = true,
    lazy = false,
    priority = 1000,
    keys = {
      {
        "<leader>Tt",
        function()
          vim.cmd("Neotree close")
          require("terra-core.actions.config").select_theme()
        end,
        desc = "Select theme",
      },
      {
        "<leader>Tv",
        function()
          vim.cmd("Neotree close")
          require("terra-core.actions.config").select_variant()
        end,
        desc = "Select variant",
      },
    },

    ---@type TerraConfig
    opts = {
      theme = "fall",
      variant = "night",
      transparent = false,
      diagnostics = {
        background = true,
      },
    },
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = false,
        styles = {
          comments = "italic",
          functions = "italic,bold",
          keywords = "bold",
        },
      },
      palettes = {
        terafox = {
          magenta = "#a778d2",
          red = "#ee5e75",
          orange = "#ca7b36",
          -- bg0 = "#0e1c15",
          -- bg1 = "#152A1F",
          bg0 = "#14211a",
          bg1 = "#18271f",
        },
      },
      groups = {
        all = {
          NeoTreeTitleBar = {
            bg = "palette.bg0",
            fg = "palette.orange",
          },
          NeoTreeFloatBorder = {
            fg = "palette.bg0",
          },
          FloatBorder = {
            bg = "palette.bg0",
            fg = "palette.bg0",
          },
        },
      },
    },
  },

  {
    "projekt0n/github-nvim-theme",
  },
}

return M.specs