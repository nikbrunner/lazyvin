local M = {}

---@type LazySpec
M.spec = {
  "nanozuki/tabby.nvim",
  -- keys = {
  --   {},
  -- },
  config = function()
    require("tabby.tabline").use_preset("active_wins_at_tail", {
      theme = {
        fill = "TabLineFill", -- tabline background
        head = "TabLine", -- head element highlight
        current_tab = "TabLineSel", -- current tab label highlight
        tab = "TabLine", -- other tab label highlight
        win = "TabLine", -- window highlight
        tail = "TabLine", -- tail element highlight
      },
    })
  end,
}

return M.spec
