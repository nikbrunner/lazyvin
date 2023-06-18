local fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ("  %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

---@type LazySpec
local spec = {
  "kevinhwang91/nvim-ufo",
  enabled = true,
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
    -- Folding preview, by default h and l keys are used.
    -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
    -- On second press the preview will be closed and fold will be opened.
    -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
    {
      "anuvyklack/fold-preview.nvim",
      dependencies = "anuvyklack/keymap-amend.nvim",
      config = true,
    },
  },
  event = "BufRead",
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
      return { "treesitter", "indent" }
    end,
    fold_virt_text_handler = fold_virt_text_handler,
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

return spec
