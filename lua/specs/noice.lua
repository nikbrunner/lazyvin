local M = {}

---@type LazySpec
M.spec = {
  "folke/noice.nvim",
  keys = {
    { "<c-f>", false, mode = { "i", "n", "s" } },
    { "<c-b>", false, mode = { "i", "n", "s" } },
  },

  opts = function(_, opts)
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })

    opts.presets.lsp_doc_border = true
    opts.presets.inc_rename = false
    opts.presets.command_palette = true
    opts.presets.long_message_to_split = true
    opts.presets.bottom_search = false
  end,
}

return M.spec
