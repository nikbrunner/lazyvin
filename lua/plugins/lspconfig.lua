---@diagnostic disable: missing-fields
local M = {}

---@type LazySpec
M.spec = {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "gr", "<cmd>Trouble lsp_references<CR>", desc = "LSP References (Trouble)" }
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
    diagnostics = {
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
        -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
        -- prefix = "icons",
      },
    },

    ---@type lspconfig.options
    servers = {
      tsserver = {
        init_options = {
          hostInfo = "neovim",
          ---@see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
          preferences = {
            importModuleSpecifierPreference = "relative",
          },
        },
      },
    },
  },
}

return M.spec
