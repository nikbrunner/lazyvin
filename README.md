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

## TODO

- [ ] Fix Treesitter Inline Syntax Failures
  - [Neovim Treesitter Syntax gets frequently partially broken after making changes to the file : neovim](https://www.reddit.com/r/neovim/comments/16pzaap/neovim_treesitter_syntax_gets_frequently/)
- [ ] Browse Pull Request Files
- [ ] Build out `groups.lua` to accept configurations for different projects
- [ ] Finish GitHub PR Files functionality [telescope-github.nvim/lua/telescope/\_extensions/gh_builtin.lua at master · nvim-telescope/telescope-github.nvim](https://github.com/nvim-telescope/telescope-github.nvim/blob/master/lua/telescope/_extensions/gh_builtin.lua)
- [ ] Fix `eslint` warnings

## Other configs

- [dotfiles/.config/nvim/lua/config at master · treeman/dotfiles](https://github.com/treeman/dotfiles/tree/master/.config/nvim/lua/config)
