local M = {}

---@type LazySpec
M.spec = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    {
      "W",
      mode = { "n", "x" },
      function()
        require("flash").jump({
          pattern = vim.fn.expand("<cword>"),
        })
      end,
      desc = "Flash from Word",
    },
  },
}

return M.spec
