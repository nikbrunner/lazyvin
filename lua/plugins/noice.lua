---@type LazySpec
local spec = {
  "folke/noice.nvim",
  opts = {
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
