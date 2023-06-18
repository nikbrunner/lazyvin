---@type LazySpec
local spec = {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
  },
}

return spec
