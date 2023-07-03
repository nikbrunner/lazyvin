---@type LazySpec
local terra_spec = {
  "terra-theme/terra-core.nvim",

  -- TODO: Fix Module Name
  -- The lua module folder is called `terra`, but the module name is `terra-core`
  -- This would also allow us to use `require("terra")` instead of `require("terra-core")`
  -- This would also allow setting up the plugin without the `config` function
  -- Check how other people are doing it
  dev = true,
  lazy = false,
  priority = 1000,

  ---@type TerraConfig
  opts = {
    theme = "winter",
    variant = "night",
    transparent = false,
    diagnostics = {
      background = true,
    },
  },

  config = function(_, opts)
    local terra = require("terra")
    terra.setup(opts)
  end,
}

---@type LazySpec
local whichkey_spec = {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>T"] = { name = "Terra" },
    },
  },
}

return {
  terra_spec,
  whichkey_spec,
}
