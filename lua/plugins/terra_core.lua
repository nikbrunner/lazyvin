local M = {}

---@type LazySpec
M.spec = {
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
}

return M.spec
