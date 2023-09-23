local create_autocmd = vim.api.nvim_create_autocmd

-- Close these filetypes with <Esc> in normal mode
create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
    "diagmsg",
    "chatpgpt",
    "ObsidianBacklinks",
    "fzf",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})
