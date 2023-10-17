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
        desc = "Current buffer (:q)",
      },
      {
        "<leader>qa",
        desc = "All buffers (:qa)",
        vim.cmd.qa,
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
