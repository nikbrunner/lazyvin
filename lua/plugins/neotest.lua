---@source [Run and Debug TypeScript Unit Tests in Neovim](https://gist.github.com/elijahmanor/bac05af95e1536d88a43cbfcb66c1c1d)

---@type LazySpec
local spec = {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "haydenmeade/neotest-jest",
      "marilari88/neotest-vitest",
    },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run Last Test",
      },
      {
        "<leader>tL",
        function()
          require("neotest").run.run_last({ strategy = "dap" })
        end,
        desc = "Debug Last Test",
      },
      {
        "<leader>tw",
        "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
        desc = "Run Watch",
      },
    },
    opts = function(_, default_opts)
      table.insert(
        default_opts.adapters,
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(default_opts.adapters, require("neotest-vitest"))
    end,
  },
}

return spec
