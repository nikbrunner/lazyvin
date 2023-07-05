---@type LazySpec
local spec = {
  "folke/noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        border = {
          style = "rounded",
          padding = { 0, 2 },
        },
      },
    },
    routes = {
      -- don't show messages when buffer is written
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
    messages = {
      enabled = false, -- enables the Noice messages UI
    },
    -- NOTE: Notify causes flickering on the Cursor in some Terminals
    -- I noticed it in iTerm and also Warp
    -- Kitty seems to be the only one without this issue
    notify = {
      enabled = false,
      view = "notify",
    },
    lsp = {
      progress = {
        enabled = false,
      },
      hover = {
        ---@type NoiceViewOptions
        opts = {
          border = {
            style = "single",
            padding = { 0, 2 },
          },
        },
      },
    },
  },
}

return spec
