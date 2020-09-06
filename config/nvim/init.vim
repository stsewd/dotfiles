scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

call plug#begin('~/.local/share/nvim/plugged')


" ## General Utilities

Plug 'mhinz/vim-startify'  " Start screen
Plug 'itchyny/lightline.vim'
Plug 'pacha/vem-tabline'
Plug 'stsewd/spotify.nvim', {'do': ':UpdateRemotePlugins'}  " Control Spotify


" ## Editor Utilities

Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'tpope/vim-commentary'  " Comment lines easily``
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'tpope/vim-unimpaired'  " Handy bracket mappings
Plug 'tpope/vim-repeat'  " Extend '.' for repeat scripts actions
Plug 'tpope/vim-eunuch'  " Command line utilities
Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}  " Close/hide/delete current buffer
Plug 'nvim-treesitter/nvim-treesitter'  " treesitter integration: highlight, text-objects, etc


" ## Navigation

Plug 'kyazdani42/nvim-tree.lua'
Plug 'liuchengxu/vista.vim'
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

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'


" ## Themes & Color Schemes

Plug 'ryanoasis/vim-devicons'  " Show icons on filetypes
Plug 'ayu-theme/ayu-vim'


" ## Languages

Plug 'sheerun/vim-polyglot'

" ### HTML

Plug 'alvan/vim-closetag'  " Closes tag after '>'

" ### Python

Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" ### ReStructuredText

Plug 'stsewd/sphinx.nvim', {'do': ':UpdateRemotePlugins'}

" ### Vim

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

call plug#end()


" ..........................................................
" # Settings
" ..........................................................

" ## UI

set title
set mouse=a
set updatetime=100
set noshowmode
set pumblend=30
set noswapfile

set colorcolumn=100  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor

set diffopt+=vertical  " Always use vertical diffs

set hidden
set spelllang=en,es


" ## Lines

set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set nojoinspaces  " Always use one space to join line

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=2
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
set inccommand=nosplit " Show replace live preview

" Use rg for :grep
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m


" ## Theme & Colorscheme

set termguicolors  " Active true colors on terminal
let g:ayucolor = 'mirage'  " mirage, light, dark
colorscheme ayu


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
nnoremap <leader>e :e! <bar> TSBufEnable highlight<CR>

" Edit init.vim
nnoremap <leader>i :e $MYVIMRC<CR>

" Clear highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

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
nnoremap * *N
nnoremap # #N

" Keep undo
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Exit terminal mode with escape
tnoremap <Esc> <C-\><C-n>
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


augroup CustomTerminalAutoCommand
  autocmd!
  " - Start on insert mode
  autocmd TermOpen * startinsert
  " - Excecute previous command with <CR>
  autocmd TermOpen * noremap <buffer> <CR> a<C-p><CR><C-\><C-n>
  " - Don't show line numbers
  autocmd TermOpen * setlocal norelativenumber nonumber
augroup end


augroup CustomAutoCommand
  autocmd!
  " - Highligh on yank
  autocmd TextYankPost *
        \ silent! lua require'vim.highlight'.on_yank {timeout=250}
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
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-tsserver',
    \ 'coc-tag',
    \ 'coc-clangd',
    \]

" Show documentation using K
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    normal! K
  else
    call CocAction('doHover')
  endif
endfunction

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
nmap <silent> gr <Plug>(coc-rename)
nmap <silent> qf <Plug>(coc-fix-current)
nnoremap <silent> <space>l :CocCommand<CR>

imap <silent> <C-j> <Plug>(coc-snippets-expand-jump)
nmap <silent> <C-w><leader> <Plug>(coc-float-jump)
inoremap <silent><expr> <C-n> coc#refresh()

" Move to prev/next error
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)


" ## Luatree

nnoremap <silent> <leader>n :LuaTreeToggle<CR>
nnoremap <silent> <leader>N :LuaTreeFindFile<CR>

let g:lua_tree_show_icons = {'git': 1, 'icons': 0, 'folders': 1}
let g:lua_tree_ignore = [
      \ '.git', 'node_modules', '.cache', '\.pyc$', '__pycache__', 'tags',
      \]
let g:lua_tree_icons = {
      \ 'default': '  ',
      \ 'folder': {'default': '', 'open': ''},
      \}

highlight link LuaTreeFolderName NERDTreeDir
highlight link LuaTreeSpecialFile Normal


" ## Vista

let g:vista_default_executive = 'coc'
let g:vista_sidebar_width = 40
let g:vista_echo_cursor = 0

nnoremap <silent> <leader>m :Vista!!<CR>
nnoremap <silent> <leader>M :Vista ctags<CR>

" ## Wordmotion

" Disable uppercase mappings
let g:wordmotion_mappings = {
      \ 'W': '',
      \ 'E': '',
      \ 'B': '',
      \ 'gE': '',
      \ 'aW': '',
      \ 'iW': '',
      \ '<C-R><C-A>': '',
      \}


" ## vem-tabline

let g:vem_tabline_show = 2
nmap <leader>j <Plug>vem_next_buffer-
nmap <leader>k <Plug>vem_prev_buffer-


" ## Lightline

let g:lightline = {'colorscheme': 'ayu'}
let g:lightline.enable = {'tabline': 0}
let g:lightline.separator = {'left': '', 'right': ''}
let g:lightline.component_function = {'gitbranch': 'FugitiveHead'}
let g:lightline.active = {}
let g:lightline.active.left = [
      \ ['mode', 'paste'],
      \ ['gitbranch', 'readonly', 'filename', 'modified'],
      \]
let g:lightline.active.right = [
      \ ['lineinfo'], ['percent'], ['filetype'],
      \]


" ## FZF

let g:fzf_command_prefix = 'Fz'
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Open fzf in a floating window
let g:fzf_layout = {'window': {'width': 0.9, 'height': 0.5}}

nnoremap <silent> <leader>f :call <SID>open_fzf()<CR>

function! s:open_fzf()
  let l:choices = [
        \ ['[f]iles', 'Files'], ['[o]pen buffers', 'Buffers'], ['[l]ines', 'BLines'], ['[r]g', 'Rg'],
        \ ['[c]ommands', 'Commands'], ['git [s]tatus', 'GFiles?'], ['[g]it checkout', 'GBranches'],
        \ ['[h]istory', 'History'], ['history[:]', 'History:'], ['history[/]', 'History/'],
        \]
  let l:options = map(copy(l:choices), 'v:val[0]')
  echo 'Fzf ' . join(l:options, ', ') . ': '
  let l:key = nr2char(getchar())
  let l:match = match(l:options, '\[' . l:key . '\]')
  redraw | echo
  if l:match >= 0
    execute ':' . g:fzf_command_prefix . l:choices[l:match][1]
  endif
endfunction


" ## Indentline

let g:indentLine_setColors = 0

let g:indentLine_bufTypeExclude = ['terminal', 'help']
let g:indentLine_fileTypeExclude = [
      \ 'text', 'man', 'rst', 'vader', 'help',
      \ 'markdown', 'startify', 'tsplayground',
      \]

" Deactivate on sneak
augroup indentLineAu
  autocmd!
  autocmd User SneakEnter IndentLinesDisable
  autocmd User SneakLeave call <SID>indentline_enable()
augroup END

function! s:indentline_enable()
  if (index(g:indentLine_fileTypeExclude, &filetype) < 0 &&
      \ index(g:indentLine_bufTypeExclude, &buftype) < 0)
    silent IndentLinesEnable
  endif
endfunction


" ## Closetag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*tmpl'


" ## Sneak

let g:sneak#label = 1  " Show labels

" Always show labels
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S


" ## Gina

noremap <leader>go :Gina browse :<CR>
nnoremap <leader>gO :Gina browse<CR>
nnoremap <leader>gp :Gina push<CR>
nnoremap <leader>gP :Gina pull<CR>


" ## Fugitive

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gu :Gread<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>


" ## Markdown

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1


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
      \]

let g:startify_lists = [
      \ {'type': 'sessions'},
      \ {'type': 'commands'},
      \]


" ## Treesitter

" Don't highlight errors
highlight link TSError Normal
highlight link TSDefinition TSDefinitionUsage

luafile $HOME/.config/nvim/init.lua
