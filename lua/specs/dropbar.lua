local M = {}

---@type LazySpec
M.spec = {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  -- TODO: Enable if able to navigate between panes
  enabled = false,
  dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
  keys = {
    {
      "gp",
      function()
        require("dropbar.api").pick()
      end,
      desc = "Pick a dropbar",
    },
  },
  opts = {},
}

return M.spec
