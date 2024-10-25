local M = {}

function M.delete_current_file()
  local file = vim.fn.expand("%:p")
  -- Unload/close buffer
  vim.cmd("bdelete!")
  vim.fn.delete(file)
  vim.notify("Deleted " .. file)
end

--- Go to the next/previous git conflict marker.
function M.goto_git_conflict(prev)
  prev = prev or false
  -- b is for backwards, W is to prevent going back to the first/last line.
  local flags = prev and "bW" or "W"
  -- Markers can be: `<<<<<<<`, `=======`, `>>>>>>>`.
  vim.fn.search("^[<=>|]\\{7}", flags)
end

--- Go to the next/previous file in the current directory.
function M.goto_file_entry(prev)
  prev = prev or false
  -- Get the current file name
  local current_file = vim.fn.expand("%:p")
  local current_dir = vim.fs.dirname(current_file)

  -- Get all the files from the current directory
  local files = {}
  for filename, type in vim.fs.dir(current_dir) do
    if type == "file" then
      table.insert(files, filename)
    end
  end

  table.sort(files)

  -- Get the current file index (lua is 1-based index).
  local index = vim.fn.index(files, vim.fs.basename(current_file)) + 1
  index = prev and index - 1 or index + 1
  if index <= 0 or index >= #files then
    vim.notify("No more files to go to")
    return
  end

  local file = vim.fs.joinpath(current_dir, files[index])
  vim.cmd.edit(vim.fn.fnamemodify(file, ":."))
end

return M
