---@diagnostic disable: missing-fields
local M = {}

M.specs = {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },

  {
    "terra-theme/terra-core.nvim",
    dev = true,
    lazy = false,
    priority = 1000,
    keys = {
      {
        "<leader>vTt",
        function()
          require("terra-core.actions.config").select_theme()
        end,
        desc = "Select theme",
      },
      {
        "<leader>vTv",
        function()
          require("terra-core.actions.config").select_variant()
        end,
        desc = "Select variant",
      },
    },

    ---@type TerraConfig
    opts = {
      theme = "spring",
      variant = "night",
      transparent = true,
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
        transparent = true,
      },
    },
  },
}

return M.specs
