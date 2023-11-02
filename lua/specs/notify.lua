local M = {}

---@type LazySpec
M.spec = {
  "rcarriga/nvim-notify",
  enabled = true,
  opts = {
    timeout = 3000,
    background_colour = "NormalFloat",
    fps = 60,
    render = "minimal",
    stages = "static",
    top_down = true,
  },
}

return M.spec
