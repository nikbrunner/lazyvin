local M = {}

---@type LazySpec
M.spec = {
  "L3MON4D3/LuaSnip",
  -- Disable LuaSnip's default mappings
  ---@diagnostic disable-next-line: assign-type-mismatch
  keys = function()
    return {}
  end,
}

return M.spec
