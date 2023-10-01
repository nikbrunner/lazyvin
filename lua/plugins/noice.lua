local M = {}

---@type LazySpec
M.spec = {
  "folke/noice.nvim",
  keys = {
    { "<c-f>", false, mode = { "i", "n", "s" } },
    { "<c-b>", false, mode = { "i", "n", "s" } },
  },
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
      enabled = true, -- enables the Noice messages UI
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
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  },
}

return M.spec
