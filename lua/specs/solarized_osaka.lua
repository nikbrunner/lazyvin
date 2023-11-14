local M = {}

---@type LazySpec
M.spec = {
  "craftzdog/solarized-osaka.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    -- TODO: The documentation is wrong. The default setting for `transparent` is true
    transparent = false, -- Enable this to disable setting the background color
  },
}

return M.spec
