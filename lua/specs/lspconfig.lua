---@diagnostic disable: missing-fields
local M = {}

---@type LazySpec
M.spec = {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()

    keys[#keys + 1] = { "gr", "<cmd>FzfLua lsp_references<CR>", desc = "LSP References (FzfLua)" }
    keys[#keys + 1] = { "gR", "<cmd>Trouble lsp_references<CR>", desc = "LSP References (Trouble)" }
    keys[#keys + 1] =
      { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", desc = "LSP Code Actions (FzfLua)", mode = { "n", "v" } }
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
        root_dir = function(...)
          return require("lspconfig.util").root_pattern(".git")(...)
        end,
        init_options = {
          hostInfo = "neovim",
          ---@see https://github.com/typescript-language-server/typescript-language-server#initializationoptions
          preferences = {
            importModuleSpecifierPreference = "relative",
          },
        },
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "literal",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    },
  },
}

return M.spec
