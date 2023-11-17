local Util = require("lazyvim.util")

-- Source: https://github.com/kdheepak/lazygit.nvim/issues/22#issuecomment-1815426074

local M = {
  term_opts = { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false, size = { width = 1, height = 1 } },
}

-- Function to check clipboard with retries
function M.getRelativeFilepath(retries, delay)
  local relative_filepath
  ---@diagnostic disable-next-line: unused-local
  for i = 1, retries do
    relative_filepath = vim.fn.getreg("+")
    if relative_filepath ~= "" then
      return relative_filepath -- Return filepath if clipboard is not empty
    end
    vim.loop.sleep(delay) -- Wait for 200ms before retrying
  end
  return nil -- Return nil if clipboard is still empty after retries
end

-- Function to handle editing from Lazygit
function M.lazyGitEdit(original_buffer)
  local current_bufnr = vim.fn.bufnr("%")
  local channel_id = vim.fn.getbufvar(current_bufnr, "terminal_job_id")

  if not channel_id then
    vim.notify("No terminal job ID found.", vim.log.levels.ERROR)
    return
  end

  vim.fn.chansend(channel_id, "\15") -- \15 is <c-o>
  vim.cmd("close") -- Close Lazygit

  local relative_filepath = M.getRelativeFilepath(5, 50)
  if not relative_filepath then
    vim.notify("Clipboard is empty or invalid.", vim.log.levels.ERROR)
    return
  end

  local winid = vim.fn.bufwinid(original_buffer)

  if winid == -1 then
    vim.notify("Could not find the original window.", vim.log.levels.ERROR)
    return
  end

  vim.fn.win_gotoid(winid)
  vim.cmd("e " .. relative_filepath)
end

function M.startLazygit()
  local current_buffer = vim.api.nvim_get_current_buf()
  local float_term = Util.terminal.open({ "lazygit" }, M.term_opts)

  -- Store the buffer ID of the floating terminal in a local variable.
  -- This ensures a stable reference for the buffer, as `float_term`
  -- might change or be out of scope in asynchronous callbacks and autocommands.
  local float_term_buf = float_term.buf

  vim.keymap.set("t", "<c-e>", function()
    M.lazyGitEdit(current_buffer)
    vim.api.nvim_buf_delete(float_term_buf, { force = true })
  end, { buffer = float_term_buf, noremap = true, silent = true })

  vim.api.nvim_create_autocmd("TermClose", {
    buffer = float_term_buf,
    callback = function()
      -- Delay the buffer deletion to ensure the terminal job has ended
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(float_term_buf) then
          pcall(function()
            vim.api.nvim_buf_delete(float_term_buf, { force = true })
          end)
        end
      end, 10) -- delay in milliseconds, adjust as needed
    end,
  })
end

function M.startGithubDash()
  Util.terminal.open({ "gh", "dash" }, M.term_opts)
end

return M
