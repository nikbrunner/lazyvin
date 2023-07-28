local utils = require("lib.utils")

local M = {}

local AUTO_LOG_PREFIX = "Test"
print(vim.inspect("Test: edit.lua [[AUTO_LOG_PREFIX]]", AUTO_LOG_PREFIX))

local filetype_log_map = {
  typescript = function(message)
    return "console.log" .. "(" .. message .. ")"
  end,
  typescriptreact = function(message)
    return "console.log" .. "(" .. message .. ")"
  end,
  javascript = function(message)
    return "console.log" .. "(" .. message .. ")"
  end,
  javascriptreact = function(message)
    return "console.log" .. "(" .. message .. ")"
  end,
  astro = function(message)
    return "console.log" .. "(" .. message .. ")"
  end,
  go = function(message)
    return "fmt.Println" .. "(" .. message .. ")"
  end,
  lua = function(message)
    return "print" .. "(vim.inspect(" .. message .. "))"
  end,
}

M.log_symbol = function()
  local current_word = vim.fn.expand("<cword>")
  local current_filename = utils.get_current_filename(true)
  local message = table.concat({
    '"',
    AUTO_LOG_PREFIX,
    ": ",
    current_filename,
    " [[",
    current_word,
    ']]", ',
    current_word,
  })
  local log_func = filetype_log_map[vim.bo.filetype]
  if log_func then
    vim.cmd("norm o" .. log_func(message))
  end
end

M.delete_logs = function()
  local buffer = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)
  local new_lines = {}

  local log_func = filetype_log_map[vim.bo.filetype]
  local print_cmd = log_func and log_func('"' .. AUTO_LOG_PREFIX .. '"') or nil

  local deleted_lines = 0
  for _, line in ipairs(lines) do
    if print_cmd and string.find(line, print_cmd) == nil then
      table.insert(new_lines, line)
    else
      deleted_lines = deleted_lines + 1
    end
  end

  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, new_lines)
  vim.notify("Deleted " .. deleted_lines .. " lines", vim.log.levels.INFO, { title = "Auto Log" })
end

return M
