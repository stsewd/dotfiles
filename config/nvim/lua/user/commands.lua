vim.cmd([[ command! U Lazy update ]])

-- Remove trailing white spaces
vim.cmd("command! -range=% RemoveTrailing <line1>,<line2>s/\\s\\+$//e")
vim.cmd("command! -nargs=+ -complete=file Grep silent grep! <args> <bar> cwindow")

-- Delete the current file
vim.cmd("command! Delete lua require'user.utils'.delete_current_file()")

vim.cmd([[
augroup CustomAutoCommand
  autocmd!
  " - Start on insert mode
  autocmd TermOpen * startinsert
  " - Execute previous command with <CR>
  autocmd TermOpen * noremap <buffer> <CR> a<C-p><CR><C-\><C-n>
  " - Don't show line numbers
  autocmd TermOpen * setlocal norelativenumber nonumber
  " - Highlight on yank
  autocmd TextYankPost *
        \ silent! lua require'vim.highlight'.on_yank {timeout = 300}
augroup end
]])

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
