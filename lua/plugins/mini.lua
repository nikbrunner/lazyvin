local M = {}

---@type LazySpec
M.specs = {
  {
    "echasnovski/mini.hues",
    version = "*",
    config = function()
      require("mini.hues").setup({
        ---@type string
        background = "#171d1b",

        ---@type string
        foreground = "#88b0a7",

        ---@type 2 | 4 | 8 | 16
        n_hues = 8,

        ---@type "low" | "medium" | "high"
        saturation = "medium",

        ---@type "bg" | "fg" | "red" | "orange" | "yellow" | "green" | "cyan" | "azure" | "blue" | "purple"
        accent = "bg",
      })
    end,
  },
}

return M.specs
