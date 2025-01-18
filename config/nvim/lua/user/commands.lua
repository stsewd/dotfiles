local map = vim.keymap.set

vim.cmd("command! U Lazy update")

-- Remove trailing white spaces
vim.cmd("command! -range=% RemoveTrailing <line1>,<line2>s/\\s\\+$//e")
vim.cmd("command! -nargs=+ -complete=file Grep silent grep! <args> <bar> cwindow")

-- Delete the current file
vim.cmd("command! Delete lua require'user.utils'.delete_current_file()")

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("UserOnTerminalOpen", {}),
  pattern = "*",
  desc = "Setup terminal window options",
  callback = function()
    -- Start on insert mode
    vim.cmd.startinsert()
    -- Execute previous command with <CR>
    map("n", "<CR>", "a<C-p><CR><C-\\><C-n>", { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("UserOnTextYankPost", {}),
  pattern = "*",
  desc = "Highlight on yank",
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

vim.api.nvim_create_autocmd("OptionSet", {
  group = vim.api.nvim_create_augroup("UserOptionSet", {}),
  pattern = "background",
  desc = "Change colorscheme on background change",
  callback = function()
    local light = "solarized"
    local dark = "tokyonight-storm"
    local current = vim.g.colors_name
    local new = vim.o.background == "light" and light or dark
    if current ~= new then
      vim.cmd("colorscheme " .. new)
    end
  end,
})

vim.cmd([[
  " Save current view settings on a per-window, per-buffer basis.
  " https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
  function! AutoSaveWinView()
    if !exists('w:SavedBufView')
      let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr('%')] = winsaveview()
  endfunction

  " Restore current view settings.
  function! AutoRestoreWinView()
    let buf = bufnr('%')
    if exists('w:SavedBufView') && has_key(w:SavedBufView, buf)
      let v = winsaveview()
      let atStartOfFile = v.lnum == 1 && v.col == 0
      if atStartOfFile && !&diff
        call winrestview(w:SavedBufView[buf])
      endif
      unlet w:SavedBufView[buf]
    endif
  endfunction

  augroup AutoRestoreWinAutoCommand
    autocmd!
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
  augroup end
]])
