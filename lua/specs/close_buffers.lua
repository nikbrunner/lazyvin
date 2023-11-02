---@diagnostic disable: missing-fields
local M = {}

---@type LazySpec
M.spec = {
  "kazhala/close-buffers.nvim",
  event = "VeryLazy",
  ---@diagnostic disable-next-line: assign-type-mismatch
  keys = function()
    local close = require("close_buffers")

    ---@type LazyKeys[]
    local keys = {
      {
        "<leader>qq",
        vim.cmd.q,
        desc = "Quit Current (:q)",
      },
      {
        "<leader>qA",
        desc = "Quit All (:qa)",
        vim.cmd.qa,
      },
      {
        "<leader>qw",
        vim.cmd.wq,
        desc = "Save & Quit Current (:wq)",
      },
      {
        "<leader>qW",
        desc = "Save & Quit All (:wqa)",
        vim.cmd.wqa,
      },
      {
        "<leader>qo",
        function()
          close.delete({ type = "other" })
        end,
        desc = "Other Buffers",
      },
      {
        "<leader>qh",
        function()
          close.delete({ type = "hidden", force = true })
        end,
        desc = "Hidden Buffers",
      },
    }

    return keys
  end,
}

return M.spec
