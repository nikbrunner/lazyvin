local spec = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = function(_, default_opts)
    local icons = require("lazyvim.config").icons
    return vim.tbl_deep_extend("force", default_opts, {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = true,
      },

      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },

      icons = {
        breadcrumb = "/",
        separator = "",
        group = icons.kinds.Folder,
      },

      popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },

      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 1, 1, 1, 1 },
        winblend = 0,
      },

      layout = {
        height = { min = 5, max = 10 },
        width = { min = 20, max = 50 },
        spacing = 5,
        align = "center",
      },

      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "GoTo" },
        ["gz"] = { name = "Surround" },
        ["]"] = { name = "Next" },
        ["["] = { name = "Prev" },
        ["<leader><tab>"] = { name = "Tabs" },
        ["<leader>b"] = { name = "Buffer" },
        ["<leader>c"] = { name = "Code" },
        ["<leader>ci"] = { name = "(AI) Actions" },
        ["<leader>f"] = { name = "File & Find" },
        ["<leader>g"] = { name = "Git" },
        ["<leader>gh"] = { name = "Hunks" },
        ["<leader>q"] = { name = "Quit & session" },
        ["<leader>s"] = { name = "Search" },
        ["<leader>u"] = { name = "UI" },
        ["<leader>l"] = { name = "LazyVin" },
        ["<leader>w"] = { name = "Windows" },
        ["<leader>x"] = { name = "Diagnostics & Quickfix" },
      },
    })
  end,
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.defaults)
  end,
}

return spec
