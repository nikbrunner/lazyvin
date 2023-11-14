local M = {}

---@type LazySpec
M.spec = {
  "williamboman/mason.nvim",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "astro-language-server",
      "css-lsp",
      "html-lsp",
      "luacheck",
      "marksman",
      "shellcheck",
      "shfmt",
      "stylua",
      "tailwindcss-language-server",
      "typescript-language-server",
      "yaml-language-server",
    })
  end,
}

return M.spec
