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
        vim.cmd.wq,
        desc = "Save & Quit Current (:wq)",
      },
      {
        "<leader>qa",
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
  config = function()
    local close = require("close_buffers")

    vim.api.nvim_create_user_command("Qo", function()
      close.delete({ type = "other" })
      vim.notify("Quit other buffers", vim.log.levels.INFO, {
        title = "Close Buffers",
      })
    end, {
      desc = "Quit other buffers",
    })

    vim.api.nvim_create_user_command("Qh", function()
      close.delete({ type = "hidden" })
      vim.notify("Quit hidden buffers", vim.log.levels.INFO, {
        title = "Close Buffers",
      })
    end, {
      desc = "Quit hidden buffers",
    })
  end,
}

return M.spec
