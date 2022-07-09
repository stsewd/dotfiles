" .........................................................
" # Plugins
" .........................................................

call plug#begin()


" ## General Utilities

Plug 'nvim-treesitter/playground'
Plug 'mhinz/vim-startify'  " Start screen
Plug 'rcarriga/nvim-notify'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'stsewd/spotify.nvim', {'do': ':UpdateRemotePlugins'}  " Control Spotify


" ## Editor Utilities

Plug 'lukas-reineke/indent-blankline.nvim'  " Show indentation lines
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'tpope/vim-commentary'  " Comment lines easily
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'tpope/vim-unimpaired'  " Handy bracket mappings
Plug 'tpope/vim-repeat'  " Extend '.' for repeat scripts actions
Plug 'tpope/vim-eunuch'  " Command line utilities
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}  " Close/hide/delete current buffer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'


" ## Navigation

Plug 'kyazdani42/nvim-tree.lua'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'  " General fuzzy finder
Plug 'stsewd/fzf-checkout.vim'
Plug 'stsewd/gx-extended.vim'


" ## Text Objects & Motions

Plug 'chaoren/vim-wordmotion'  " Wordmotion text-object
Plug 'wellle/targets.vim'  " Operator pending mappings ()[]{}
Plug 'justinmk/vim-sneak'  " s


" ## Git Integration

Plug 'airblade/vim-gitgutter'  " Show git diff on the numbers column
Plug 'tpope/vim-fugitive'  " Git wrapper
Plug 'lambdalisue/gina.vim'  " Asynchronously Git wrapper


" ## Autocompletion

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'honza/vim-snippets'
Plug 'yaegassy/coc-esbonio'


" ## Themes & Color Schemes

Plug 'kyazdani42/nvim-web-devicons'  " Show icons on filetypes
Plug 'folke/tokyonight.nvim'
Plug 'ishan9299/nvim-solarized-lua'


" ## Languages

" ### Python

Plug 'Vimjas/vim-python-pep8-indent'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" ### ReStructuredText

Plug 'stsewd/sphinx.nvim', {'do': ':UpdateRemotePlugins'}

" ### Rust

Plug 'rust-lang/rust.vim'

" ### Vim

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

call plug#end()


" ..........................................................
" # Settings
" ..........................................................

" ## General

set title
set mouse=a
set updatetime=100
set noshowmode
set pumblend=30
set noswapfile
set colorcolumn=100  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor
set diffopt+=vertical  " Always use vertical diffs
set spelllang=en,es


" ## Lines

set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=3
set foldlevel=1

set tabstop=4
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab


" ## Search & replace

set ignorecase
set smartcase
set gdefault

" Use rg for :grep
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m


" ## Theme & Colorscheme

set termguicolors  " Active true colors on terminal
let g:tokyonight_italic_comments = v:false
let g:tokyonight_style = 'storm'
colorscheme tokyonight


" ## Python providers

let g:loaded_python_provider = 0
let g:python3_host_prog = $NVIM_PYTHON_HOST


" .........................................................
"  # Mappings
" .........................................................

" Map <leader> to space
let g:mapleader = "\<space>"

" Save
nnoremap <leader>w :update<CR>

" Refresh
nnoremap <leader>e :e!<CR>

" Edit init.vim
nnoremap <leader>i :e $MYVIMRC<CR>

" Copy/cut/paste to/from clipboard
noremap <leader>y "+y
noremap <leader>d "+d
noremap <leader>p "+p
noremap <leader>P "+P

" Scroll
nnoremap <up> <c-y>
nnoremap <down> <c-e>
nnoremap <right> zl
nnoremap <left> zh

" Search
nnoremap * *``
nnoremap # #``

" Exit terminal mode with escape
tnoremap <Esc> <C-\><C-n>
tnoremap <C-[> <C-\><C-n>
" Send escape to terminal
tnoremap <A-[> <Esc>

" Copy current path with line number
nnoremap <silent> <leader>o
      \ :let @" = expand('%:p') . ':' . line('.') <bar> echo @"<CR>

" .........................................................
"  # Custom Commands and Autocommands
" .........................................................

" Remove trailing white spaces
command! -range=% RemoveTrailing <line1>,<line2>s/\s\+$//e

command! -nargs=+ -complete=file Grep silent grep! <args> <bar> cwindow

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


" ..........................................................
" # Plugins Settings
" ..........................................................

" ## coc.nvim

let g:coc_global_extensions = [
    \ 'coc-word',
    \ 'coc-syntax',
    \ 'coc-dictionary',
    \ 'coc-snippets',
    \ 'coc-emoji',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-toml',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-pyright',
    \ 'coc-rust-analyzer',
    \ 'coc-tsserver',
    \ 'coc-tag',
    \ 'coc-lua',
    \ 'coc-clangd',
    \ 'coc-esbonio',
    \]

" Show documentation using K
nnoremap <silent> K :call CocAction('doHover')<CR>
nnoremap gK K

augroup CocAutocomands
  autocmd!
  " Show function signature while completing args
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd FileType
        \ json,js,html,c,cpp,h,hh
        \ setlocal formatexpr=CocAction('formatSelected')
augroup END

" Mappings
set tagfunc=CocTagFunc
nnoremap <silent> <leader>cc :CocCommand<CR>
nmap <silent> <leader>ca <Plug>(coc-codeaction-cursor)
nmap <silent> <leader>cf <Plug>(coc-format)
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> qf <Plug>(coc-fix-current)
nnoremap <silent> <leader>cd :call CocAction('diagnosticToggle')<CR>

imap <silent> <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> <C-w><leader> <Plug>(coc-float-jump)
inoremap <silent> <expr> <C-n> coc#refresh()
inoremap <silent><expr> <CR>
      \ pumvisible()?
      \ coc#_select_confirm()
      \ : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Move to prev/next error
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)


" ## NvimTree

nnoremap <silent> <leader>n :NvimTreeToggle<CR>
nnoremap <silent> <leader>N :NvimTreeFindFile<CR>

" ## nvim-bufferline

nnoremap <silent> <leader>j :BufferLineCyclePrev<CR>
nnoremap <silent> <leader>k :BufferLineCycleNext<CR>
nnoremap <silent> gb :BufferLinePick<CR>


" ## FZF

let g:fzf_command_prefix = 'Fz'
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'

noremap <leader>ff :FzFiles<CR>
noremap <leader>fo :FzBuffers<CR>
noremap <leader>fl :FzBLines<CR>
noremap <leader>fr :FzRg<CR>
noremap <leader>fs :FzGFiles?<CR>
noremap <leader>ft :FzSphinxFiles<CR>
noremap <leader>fg :FzGBranches<CR>

" ## fzf-checkout

let g:fzf_checkout_use_current_buf_cwd = v:true
let g:fzf_checkout_git_options = '--sort=-committerdate'


" ## Indent line

let g:indent_blankline_char = '¦'
let g:indent_blankline_filetype_exclude = [
      \ 'help', 'markdown', 'text', 'rst', 'man',
      \ 'startify', 'tsplayground',
      \]
let g:indent_blankline_buftype_exclude = ['terminal', 'nofile']
let g:indent_blankline_show_trailing_blankline_indent = v:false


" ## Sneak

" Show labels
let g:sneak#label = 1
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S


" ## Gina

noremap <leader>go :Gina browse :<CR>
nnoremap <leader>gO :Gina browse<CR>
nnoremap <leader>gp :Gina push<CR>
nnoremap <leader>gP :Gina pull<CR>


" ## Fugitive

nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gu :Gread<CR>
nnoremap <silent> <leader>gc :Git commit<CR>


" ## ReStructuredText

let g:rst_style = 1


" ## rust.vim

let g:rustfmt_autosave = 1


" ## Spotify

nmap <leader>ss <Plug>(spotify-play/pause)
nmap <leader>sj <Plug>(spotify-next)
nmap <leader>sk <Plug>(spotify-prev)
nmap <leader>so <Plug>(spotify-show)
nmap <leader>sc <Plug>(spotify-status)


" ## Sayonara

nnoremap <silent> <leader>q :Sayonara<CR>
nnoremap <silent> <leader>Q :Sayonara!<CR>


" ## Startify

let g:startify_session_persistence = 1  " Autosave sessions
let g:startify_change_to_vcs_root = 1  " Change cwd to root of git project

let g:startify_custom_header = startify#pad([
      \ '>>> Happy coding @' . $USER . '!',
      \])

let g:startify_commands = [
      \ {'u': ':PlugUpgrade | PlugUpdate'},
      \ {'t': ':terminal'},
      \]

let g:startify_lists = [
      \ {'type': 'sessions'},
      \ {'type': 'commands'},
      \]


luafile $HOME/.config/nvim/config.lua
