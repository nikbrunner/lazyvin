local M = {}

M.keys = function()
  local keys = {}

  local opts = { noremap = true, silent = true }

  for i = 1, 9 do
    keys[#keys + 1] = {
      "<leader>" .. i,
      function()
        require("harpoon.ui").nav_file(i)
      end,
      desc = WhichKeyIgnoreLabel,
      opts,
    }
  end

  for i = 1, 9 do
    keys[#keys + 1] = {
      "<leader>m" .. i,
      function()
        require("harpoon.ui").nav_file(i)
      end,
      desc = WhichKeyIgnoreLabel,
      opts,
    }
  end

  keys[#keys + 1] = {
    "<leader>mm",
    function()
      require("harpoon.ui").toggle_quick_menu()
    end,
    desc = "Marks Menu",
    opts,
  }

  keys[#keys + 1] = {
    "<leader>ma",
    function()
      require("harpoon.mark").add_file()
      local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.")
      vim.notify(" " .. relative_path .. " added to Harpoon!", vim.log.levels.INFO, {
        title = "Harpoon",
        timeout = 2000,
      })
    end,
    desc = "Add file to Marks",
    opts,
  }

  return keys
end

---@type LazySpec
M.specs = {
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    ---@diagnostic disable-next-line: assign-type-mismatch
    keys = M.keys(),
    opts = {
      menu = { width = 75, height = 10 },

      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = true,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = true,
    },
  },

  {
    "folke/which-key.nvim",
    -- TODO: Only load when Harpoon is loaded/enabled
    opts = {
      defaults = {
        ["<leader>m"] = { name = "Marks" },
      },
    },
  },
}

return M.specs
