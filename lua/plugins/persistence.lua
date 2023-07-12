local M = {}

---@type LazySpec
M.spec = {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" } },
  keys = {
    -- Disable default LazyVim mappings
    { "<leader>qs", false },
    { "<leader>ql", false },
    { "<leader>qd", false },

    -- New mappings
    {
      "<leader>Sr",
      function()
        require("persistence").load()
      end,
      desc = "Restore Session",
    },
    {
      "<leader>Sl",
      function()
        require("persistence").load({ last = true })
      end,
      desc = "Restore Last Session",
    },
    {
      "<leader>Sd",
      function()
        require("persistence").stop()
      end,
      desc = "Don't Save Current Session",
    },
  },
}

return M.spec
