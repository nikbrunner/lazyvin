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
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 0,
      keymap = {
        accept = "<Tab>",
        accept_word = false,
        accept_line = false,
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-[>",
      },
    },
    filetypes = {
      yaml = true,
      markdown = true,
      help = false,
      gitcommit = true,
    },
  },
}

return spec
