local M = {}

---Function to check if a table contains a certain value
---@param tab table Table to search
---@param val unknown Value to search for
---@return integer|unknown number Index of value in tab
function M.find_index(tab, val)
  local index = nil
  for i, v in ipairs(tab) do
    if v == val then
      index = i
    end
  end
  return index
end

---Raises an error if the provided condition is false
---@param condition boolean Condition to evaluate
---@param message string Optional message to include in the error
function M.assert(condition, message)
  if not condition then
    error(message or "Assertion failed!", 2)
  end
end

---@param withExtension boolean Condition which decides if the returned filename should include the file extension
---@return string
function M.get_current_filename(withExtension)
  if withExtension then
    return vim.fn.expand("%:t")
  else
    return vim.fn.expand("%:t:r")
  end
end

---Merges the elements of multiple arrays into a single array.
---Elements that are not arrays are included in the resulting array as is.
---@param array table A list of arrays and/or single values to be merged.
---@treturn table The resulting array, containing the elements of the input array.
function M.merge(array)
  -- Initialize the result array
  local result = {}

  -- Iterate over the elements of the input array
  for i, v in pairs(array) do
    -- Check if the element is an array
    if type(v) == "table" then
      -- Iterate over the keys and values of the array
      for j, w in pairs(v) do
        -- Copy the key and value into the result array
        result[j] = w
      end
    else
      -- The element is not an array, so copy it into the result array as is
      result[i] = v
    end
  end

  -- Return the result array
  return result
end

---Run callback if the required version number is met
---@param required_version string The required version number (e.g. "0.5")
---@param callback function The callback to run if the version is met
function M.validate_nvim_version(required_version, callback)
  if vim.fn.has("nvim-" .. required_version) > 0 then
    callback()
  end
end

return M
