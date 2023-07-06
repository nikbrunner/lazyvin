---@type LazySpec
local spec = {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    -- If `glance.nvim` is available then use it for LSP References
    if require("lazyvim.util").has("glance.nvim") then
      keys[#keys + 1] = { "gr", "<cmd>Glance references<CR>", desc = "LSP References (Glance)" }
    end

    keys[#keys + 1] = { "gR", "<cmd>Trouble lsp_references<CR>", desc = "LSP References (Trouble)" }
  end,
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
