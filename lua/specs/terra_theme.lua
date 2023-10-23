---@diagnostic disable: missing-fields

local M = {}

---@type LazySpec
M.spec = {
  "terra-theme/terra-core.nvim",
  dev = true,
  lazy = false,
  priority = 1000,
  ---@diagnostic disable-next-line: assign-type-mismatch
  keys = {
    {
      "<leader>vtt",
      function()
        vim.cmd("Neotree close")
        require("terra-core.utils.config").select_theme()
      end,
      desc = "Select theme",
    },
    {
      "<leader>vtv",
      function()
        vim.cmd("Neotree close")
        require("terra-core.utils.config").select_variant()
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
}

return M.spec
