-- Settings

-- General
vim.o.title = true
vim.o.mouse = "a"
vim.o.updatetime = 100
vim.o.showmode = false
vim.o.pumblend = 30
vim.o.swapfile = false
vim.o.colorcolumn = 100
vim.o.scrolloff = 3
vim.opt.diffopt:append("vertical")
vim.opt.spelllang = { "en", "es" }
vim.o.termguicolors = true
vim.g.python3_host_prog = vim.env.NVIM_PYTHON_HOST

-- Lines
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldnestmax = 3
vim.o.foldlevel = 1

vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.expandtab = true

-- Search & replace
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.gdefault = true

-- Use rg for :grep
vim.o.grepprg = "rg --vimgrep"
vim.o.grepformat = "%f:%l:%c:%m"

-- Mappings
local map = vim.keymap.set

vim.g.mapleader = " "
map("n", "<leader>w", ":update<CR>", { desc = "Save file" })
map("n", "<leader>e", ":e!<CR>", { desc = "Refresh" })
map("n", "<leader>i", ":e $MYVIMRC<CR>", { desc = "Edit init.lua" })

-- Copy/cut/paste to/from clipboard
map("n", "<leader>y", '"+y', { desc = "Copy to clipboard" })
map("n", "<leader>d", '"+d', { desc = "Cut to clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste from clipboard" })

-- Scroll
map("n", "<up>", "<C-y>", { desc = "Scroll up" })
map("n", "<down>", "<C-e>", { desc = "Scroll down" })
map("n", "<left>", "zl", { desc = "Scroll left" })
map("n", "<right>", "zh", { desc = "Scroll right" })

-- Search
map("n", "*", "*``", { desc = "Search word under cursor without moving the cursor" })
map("n", "#", "#``", { desc = "Search word under cursor without moving the cursor" })

-- Terminal mode mappings
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode with escape" })
map("t", "<C-[>", "<C-\\><C-n>", { desc = "Exit terminal mode with escape" })
map("t", "<A-[>", "<Esc>", { desc = "Send escape to the terminal" })

-- Copy current path with line number
map("n", "<leader>o", [[:let @" = expand('%:p') . ':' . line('.') <bar> echo @"<CR>]], { silent = true })

-- Custom commands and autocommands

vim.cmd([[ command! U Lazy update ]])

-- Remove trailing white spaces
vim.cmd("command! -range=% RemoveTrailing <line1>,<line2>s/\\s\\+$//e")
vim.cmd("command! -nargs=+ -complete=file Grep silent grep! <args> <bar> cwindow")

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

-- Builtin ReStructuredText support
vim.g.rst_style = 1
