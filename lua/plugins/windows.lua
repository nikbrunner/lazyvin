local M = {}

---@type LazySpec
M.spec = {
  "anuvyklack/windows.nvim",
  event = "VeryLazy",
  dependencies = {
    "anuvyklack/middleclass",
  },
  enabled = true,
  keys = {
    {
      "<leader>wm",
      "<cmd>WindowsMaximize<CR>",
      desc = "Maximize Split",
    },
    {
      "<leader>we",
      "<cmd>WindowsEqualize<CR>",
      desc = "Equalize Split",
    },
    {
      "<leader>wa",
      "<cmd>WindowsToggleAutowidth<CR>",
      desc = "Toggle Autowidth",
    },
  },
  opts = {
    autowidth = {
      enable = true,
      winwidth = 35,
      filetype = {
        help = 2,
      },
    },
    ignore = {
      buftype = { "quickfix" },
      filetype = { "NvimTree", "neo-tree", "undotree", "gundo" },
    },
    animation = {
      enable = true,
      duration = 300,
      fps = 30,
      easing = "in_out_sine",
    },
  },
  config = function(_, opts)
    local windows = require("windows")

    vim.o.winwidth = 10
    vim.o.winminwidth = 10
    vim.o.equalalways = false
    windows.setup(opts)
  end,
}

return M.spec
