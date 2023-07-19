local M = {}

---@type LazySpec
M.spec = {
  "kevinhwang91/nvim-ufo",
  enabled = true,
  event = "BufRead",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      event = "BufRead",
      opts = function()
        local builtin = require("statuscol.builtin")
        return {
          setopt = true, -- Whether to set the 'statuscolumn' option, may be set to false for those who
          relculright = true, -- whether to right-align the cursor line number with 'relativenumber' set
          segments = {
            {
              text = { builtin.foldfunc, " " },
              click = "v:lua.ScFa",
              hl = "FoldColumn",
            },
            {
              text = { "%s" },
              hl = "SignColumn",
              click = "v:lua.ScSa",
            },
            {
              text = {
                builtin.lnumfunc,
                " ",
              },
              hl = "SignColumn",
              click = "v:lua.ScLa",
            },
          },
        }
      end,
      config = function(_, opts)
        local statuscol = require("statuscol")
        statuscol.setup(opts)
      end,
    },
  },
  keys = {
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      "Open all Folds (Ufo)",
    },
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      "Close all Folds (Ufo)",
    },
    {
      "zm",
      function()
        require("ufo").closeFoldsWith()
      end,
      "Close Folds With (Ufo)",
    },
    {
      "zp",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      "Preview Fold (Ufo)",
    },
  },
  opts = {
    ---@diagnostic disable-next-line: unused-local
    provider_selector = function(bufnr, filetype, buftype)
      -- return { "treesitter", "indent" }
      return { "treesitter" }
    end,
    preview = {
      win_config = {
        border = "rounded",
        winblend = 5,
        winhighlight = "Normal:NvimTreeNormal",
        maxheight = 20,
      },
      mappings = {
        scrollB = "",
        scrollF = "",
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        scrollE = "",
        scrollY = "",
        close = "q",
        switch = "<Tab>",
        trace = "<C-y>",
      },
    },
  },
  config = function(_, opts)
    local ufo = require("ufo")

    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "indent"
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    ufo.setup(opts)
  end,
}

return M.spec
