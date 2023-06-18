-- NOTE: Usage & Billing: https://github.com/settings/billing
-- Authentication via Plugin `:Copilot auth`

---@type LazySpec
local spec = {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    panel = {
      enabled = false,
      auto_refresh = false,
      keymap = {
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open = "<M-y>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 0,
      keymap = {
        -- NOTE: I would liked to use <Tab> but it's not working
        accept = "<C-l>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-h>",
      },
    },
    filetypes = {
      yaml = true,
      markdown = true,
      help = false,
      gitcommit = true,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
  },
  config = function(_, opts)
    vim.schedule(function()
      local copilot = require("copilot")
      copilot.setup(opts)
    end)
  end,
}

return spec
