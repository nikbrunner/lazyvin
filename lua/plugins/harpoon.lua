---@type LazySpec
local harpoon_spec = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  keys = {
    {
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
      { noremap = true, silent = true },
    },
    {
      "<leader>mm",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Marks Menu",
      { noremap = true, silent = true },
    },
    {
      "<leader>1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>5",
      function()
        require("harpoon.ui").nav_file(5)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>6",
      function()
        require("harpoon.ui").nav_file(6)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>7",
      function()
        require("harpoon.ui").nav_file(7)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>8",
      function()
        require("harpoon.ui").nav_file(8)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>9",
      function()
        require("harpoon.ui").nav_file(9)
      end,
      desc = WhichKeyIgnoreLabel,
      { noremap = true, silent = true },
    },
    {
      "<leader>m1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Jump to Harpoon 1",
      { noremap = true, silent = true },
    },
    {
      "<leader>m2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Jump to Harpoon 2",
      { noremap = true, silent = true },
    },
    {
      "<leader>m3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Jump to Harpoon 3",
      { noremap = true, silent = true },
    },
    {
      "<leader>m4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Jump to Harpoon 4",
      { noremap = true, silent = true },
    },
    {
      "<leader>m5",
      function()
        require("harpoon.ui").nav_file(5)
      end,
      desc = "Jump to Harpoon 5",
      { noremap = true, silent = true },
    },
    {
      "<leader>m6",
      function()
        require("harpoon.ui").nav_file(6)
      end,
      desc = "Jump to Harpoon 6",
      { noremap = true, silent = true },
    },
    {
      "<leader>m7",
      function()
        require("harpoon.ui").nav_file(7)
      end,
      desc = "Jump to Harpoon 7",
      { noremap = true, silent = true },
    },
    {
      "<leader>m8",
      function()
        require("harpoon.ui").nav_file(8)
      end,
      desc = "Jump to Harpoon 8",
      { noremap = true, silent = true },
    },
    {
      "<leader>m9",
      function()
        require("harpoon.ui").nav_file(9)
      end,
      desc = "Jump to Harpoon 9",
      { noremap = true, silent = true },
    },
  },
  opts = {
    menu = { width = 125, height = 10 },

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
}

---@type LazySpec
local whichkey_spec = {
  "folke/which-key.nvim",
  -- TODO: Only load when Harpoon is loaded/enabled
  opts = {
    defaults = {
      ["<leader>m"] = { name = "Marks" },
    },
  },
}

return {
  harpoon_spec,
  whichkey_spec,
}
