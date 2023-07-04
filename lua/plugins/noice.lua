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
    lsp = {
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
