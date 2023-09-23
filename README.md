# LazyVin

<a href="https://dotfyle.com/nikbrunner/lazyvin"><img src="https://dotfyle.com/nikbrunner/lazyvin/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/nikbrunner/lazyvin"><img src="https://dotfyle.com/nikbrunner/lazyvin/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/nikbrunner/lazyvin"><img src="https://dotfyle.com/nikbrunner/lazyvin/badges/plugin-manager?style=flat" /></a>

<p align="center">
  <img src="./assets/logo.png" height="350px" />
</p>

Building upon the foundation of my previous config, [Vin](https://github.com/nikbrunner/vin), LazyVin represents the next evolution in my Neovim setup. Designed to leverage the robust capabilities of LazyVim, LazyVin is an endeavor to streamline my coding environment while keeping the essence of my personalized settings alive.

## Motivation & Philosophy

<img src="./assets/illustration.png" />

My journey with Neovim and 'Vin' has taught me the value of a personal dev environment. However, maintaining and updating the configuration became a time-consuming endeavor. With over 1700 commits over 2 years, 'Vin' turned out to be a labyrinth of customizations.

LazyVin is a manifestation of my desire to simplify and delegate. By relying on the LazyVim base, the task of updates and maintenance is majorly handled by others, allowing me to focus on what truly matters: coding and learning. LazyVin maintains a minimalistic set of personal changes, keeping the interface clean and uncluttered.

LazyVin is not just about being 'lazy'. It's about embracing simplicity, minimalism, and effectiveness. It represents my shift from being a configurator to being a user - a user who wants to make the most of their tools without getting lost in them.

With LazyVin, my promise is to keep things simple, lean, and functional. It's a commitment to spend less time tinkering and more time coding, learning, and creating. LazyVin is designed to provide peace of mind, allowing for a focus on the essentials rather than the intricacies of configuration.

## Links

- [LazyVim/LazyVim: Neovim config for the lazy](https://github.com/LazyVim/LazyVim)
- [LazyVim/LazyVim · Discussions · GitHub](https://github.com/LazyVim/LazyVim/discussions?discussions_q=is:open+vscode)
- [Getting Started | LazyVim](https://www.lazyvim.org/)

## Install Instructions

> Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:nikbrunner/lazyvin ~/.config/nikbrunner/lazyvin
NVIM_APPNAME=nikbrunner/lazyvin/ nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=nikbrunner/lazyvin/ nvim
```

## Plugins

### ai

- [jackMort/ChatGPT.nvim](https://dotfyle.com/plugins/jackMort/ChatGPT.nvim)

### bars-and-lines

- [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
- [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
- [luukvbaal/statuscol.nvim](https://dotfyle.com/plugins/luukvbaal/statuscol.nvim)

### color

- [uga-rosa/ccc.nvim](https://dotfyle.com/plugins/uga-rosa/ccc.nvim)

### colorscheme

- [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
- [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
- [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)

### completion

- [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
- [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)

### diagnostics

- [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
- [piersolenski/wtf.nvim](https://dotfyle.com/plugins/piersolenski/wtf.nvim)

### file-explorer

- [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)

### fuzzy-finder

- [ibhagwan/fzf-lua](https://dotfyle.com/plugins/ibhagwan/fzf-lua)
- [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)

### git

- [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)

### indent

- [echasnovski/mini.indentscope](https://dotfyle.com/plugins/echasnovski/mini.indentscope)
- [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)

### keybinding

- [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)

### lsp

- [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
- [SmiteshP/nvim-navbuddy](https://dotfyle.com/plugins/SmiteshP/nvim-navbuddy)

### marks

- [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)

### motion

- [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)

### nvim-dev

- [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
- [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)

### plugin-manager

- [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)

### preconfigured

- [LazyVim/LazyVim](https://dotfyle.com/plugins/LazyVim/LazyVim)

### snippet

- [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)

### split-and-window

- [folke/edgy.nvim](https://dotfyle.com/plugins/folke/edgy.nvim)
- [anuvyklack/windows.nvim](https://dotfyle.com/plugins/anuvyklack/windows.nvim)

### startup

- [nvimdev/dashboard-nvim](https://dotfyle.com/plugins/nvimdev/dashboard-nvim)
- [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)

### statusline

- [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)

### tabline

- [nanozuki/tabby.nvim](https://dotfyle.com/plugins/nanozuki/tabby.nvim)
- [akinsho/bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim)

### test

- [nvim-neotest/neotest](https://dotfyle.com/plugins/nvim-neotest/neotest)

### utility

- [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- [kazhala/close-buffers.nvim](https://dotfyle.com/plugins/kazhala/close-buffers.nvim)
- [kevinhwang91/nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)

## TODO

- [ ] Migrate to FzfLua - Until Telescope can be disabled
- [ ] Make better use of Tresitter Movements
- [ ] Fix Treesitter Inline Syntax Failures
  - [Neovim Treesitter Syntax gets frequently partially broken after making changes to the file : neovim](https://www.reddit.com/r/neovim/comments/16pzaap/neovim_treesitter_syntax_gets_frequently/)
- [ ] Browse Pull Request Files
