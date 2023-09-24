local M = {}

local function copy(path)
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!', vim.log.levels.INFO)
end

function M.fullPath()
  local full_path = vim.fn.expand("%:p")
  copy(full_path)
end

function M.relativePath()
  -- Source: https://www.reddit.com/r/neovim/comments/q2s3t1/how_to_get_current_filename_relative_to_project/
  local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:.")
  copy(relative_path)
end

function M.fileName()
  local file_name = vim.fn.expand("%:t")
  copy(file_name)
end

return M
