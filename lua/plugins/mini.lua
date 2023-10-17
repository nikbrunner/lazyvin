local M = {}

---@type LazySpec
M.specs = {
  {
    "echasnovski/mini.hues",
    version = "*",
  },
  {
    "echasnovski/mini.pick",
    keys = {
      {
        "<leader>ff",
        function()
          require("mini.pick").builtin.files({ tool = "git" })
        end,
        desc = "Find Files",
      },
    },
    config = function()
      require("mini.pick").setup()
    end,
  },
}

return M.specs
