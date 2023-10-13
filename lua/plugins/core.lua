local M = {}

---@alias LazyVin.Colorscheme "kanagawa" | "tokyonight-moon" | "carbonfox" | "terafox" | "nordfox" | "terra_fall_night" | "terra_spring_night"

---@type LazySpec
M.spec = {
  "LazyVim/LazyVim",
  opts = {

    ---@type LazyVin.Colorscheme
    colorscheme = "tokyonight-moon",
  },
}

return M.spec
