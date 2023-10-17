local M = {}

---@type LazySpec
M.spec = {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require("cmp")

    -- opts.window = {
    --   completion = cmp.config.window.bordered({
    --     border = "single",
    --   }),
    --
    --   documentation = cmp.config.window.bordered({
    --     border = "single",
    --   }),
    -- }

    opts.mapping = cmp.mapping.preset.insert({
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<S-CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    })
  end,
}

return M.spec
