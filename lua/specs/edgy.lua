---@diagnostic disable: missing-fields
local M = {}

---@type LazySpec
M.spec = {
  "folke/edgy.nvim",
  event = "VeryLazy",
  enabled = true,
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  keys = {
    {
      "<leader>ue",
      require("edgy").toggle,
      desc = "Edgy Toggle Windows",
    },
    {
      "<leader>us",
      require("edgy").select,
      desc = "Edgy Select Window",
    },
    -- TODO: Improve bindings
  },
  opts = {
    ---@type table<Edgy.Pos, {size:integer, wo?:vim.wo}>
    animate = {
      enabled = false,
    },

    options = {
      left = { size = 45 },
      bottom = { size = 15 },
      right = { size = 45 },
      top = { size = 10 },
    },

    left = {
      {
        title = "Files",
        ft = "neo-tree",
        filter = function(buf, win)
          local isFloat = vim.api.nvim_win_get_config(win).relative == ""
          return isFloat and vim.b[buf].neo_tree_source == "filesystem"
        end,
        pinned = true,
        open = function()
          vim.api.nvim_input("<esc><space>ee")
        end,
        size = { height = 0.5 },
      },
    },

    right = {
      {
        title = "Git",
        ft = "neo-tree",
        filter = function(buf, win)
          local isFloat = vim.api.nvim_win_get_config(win).relative == ""
          return isFloat and vim.b[buf].neo_tree_source == "git_status"
        end,
        pinned = true,
        open = "Neotree position=right git_status",
      },

      {
        ft = "help",
        size = { width = 120 },
        -- don't open help files in edgy that we're editing
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
    },

    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "noice",
        size = { height = 0.4 },
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      {
        ft = "lazyterm",
        title = "LazyTerm",
        size = { height = 0.4 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
      "Trouble",
      {
        ft = "qf",
        title = "QuickFix",
      },
      {
        ft = "spectre_panel",
        size = { height = 0.4 },
      },
      {
        title = "Neotest Output",
        ft = "neotest-output-panel",
        size = { height = 15 },
      },
    },
  },
}

return M.spec
