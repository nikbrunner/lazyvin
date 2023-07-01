local spec = {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>ee",
      function()
        vim.cmd("Neotree left toggle")
      end,
      desc = "Float Git Tree",
    },
    {
      "<leader>eg",
      function()
        vim.cmd("Neotree right git_status toggle")
      end,
      desc = "Float Git Tree",
    },
    {
      "<C-g>",
      function()
        vim.cmd("Neotree float git_status toggle reveal")
      end,
      desc = "Float Git Tree",
    },
    {
      "<C-e>",
      function()
        vim.cmd("Neotree float buffers toggle reveal")
      end,
      desc = "Float Buffer Tree",
    },
  },
  opts = function()
    return {
      -- Fix for NerdFonts v3
      -- https://github.com/nvim-neo-tree/neo-tree.nvim#configuration-for-nerd-fonts-v3-users
      default_component_configs = {
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
    }
  end,
}

return spec
