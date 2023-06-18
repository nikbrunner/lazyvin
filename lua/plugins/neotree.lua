local spec = {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
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
  },
}

return spec
