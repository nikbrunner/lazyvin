local M = {}

---Function to list available smug sessions and start the selected one
---@return nil
function M.start_smug_session()
  local handle = io.popen("smug list") -- Run smug list to get available sessions

  if handle then
    local result = handle:read("*a") -- Read output to string
    handle:close() -- Close the handle

    if result and result ~= "" then
      local sessions = vim.split(result, "\n") -- Split the string by newline to a table

      -- Remove empty line if it exists
      if sessions[#sessions] == "" then
        table.remove(sessions)
      end

      vim.ui.select(sessions, {
        prompt = "Select a smug session:",
      }, function(session, _)
        if session then
          vim.fn.system("smug start " .. session)
        end
      end)
    else
      print("No smug sessions available.")
    end
  else
    print("Failed to run smug list.")
  end
end

return M
