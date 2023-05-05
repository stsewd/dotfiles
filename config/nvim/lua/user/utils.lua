local M = {}

function M.delete_current_file()
  local file = vim.fn.expand("%:p")
  -- Unload/close buffer
  vim.cmd("bdelete!")
  vim.fn.delete(file)
  vim.notify("Deleted " .. file)
end

return M
