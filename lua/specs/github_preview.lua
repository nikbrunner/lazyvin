local M = {}

---@type LazySpec
M.spec = {
  "wallpants/github-preview.nvim",
  cmd = { "GithubPreviewToggle" },
  keys = function()
    local gpreview = require("github-preview")
    local fns = gpreview.fns

    return {
      {
        "<leader>fpt",
        fns.toggle,
        desc = "Toggle Github Preview",
      },
      {
        "<leader>fps",
        fns.single_file_toggle,
        desc = "Toggle Github Preview Single File",
      },
      {
        "<leader>fpd",
        fns.details_tags_toggle,
        desc = "Toggle Github Preview Details Tags",
      },
    }
  end,
  config = function(_, opts)
    gpreview.setup(opts)
  end,
}

return M.spec
