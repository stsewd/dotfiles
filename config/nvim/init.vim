scriptencoding utf-8

" .........................................................
" # Plugins
" .........................................................

call plug#begin('~/.local/share/nvim/plugged')


" ## General Utilities

Plug 'mhinz/vim-startify'  " Show a start screen
Plug 'vim-airline/vim-airline'  " Status bar & tabline


" ## Editor Utilities

Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'scrooloose/nerdcommenter'  " Comment lines easily
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'tpope/vim-unimpaired'  " Handy bracket mappings
Plug 'machakann/vim-highlightedyank' " Highlight yanked text
Plug 'tpope/vim-repeat'  " Extend '.' for repeat scripts actions
Plug 'tpope/vim-eunuch'  " Command line utilities
Plug 'brooth/far.vim'  " Find and replace


" ## Navigation Utilities

Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'tpope/vim-apathy'  " Extends gf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'  " General fuzzy finder
Plug 'stsewd/fzf-checkout.vim'
Plug 'mhinz/vim-grepper'
Plug 'kana/vim-altr'  " Altern between files

Plug 'ludovicchabant/vim-gutentags'  " Automated tag file generation
Plug 'majutsushi/tagbar'  " Display tags in a window
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }  " Close/hide/delete current buffer


" ## Other Utilities

Plug 'janko-m/vim-test' " Tests execution
Plug 'stsewd/spotify.nvim', { 'do': ':UpdateRemotePlugins' }  " Control Spotify
Plug 'junegunn/goyo.vim'  " Free distraction mode


" ## Text Objects & Motions

Plug 'chaoren/vim-wordmotion'  " Wordmotion text-object

Plug 'kana/vim-textobj-user'  " Base
Plug 'jceb/vim-textobj-uri'  " URI text object (u)
Plug 'kana/vim-textobj-indent'  " Indentation text object (i)
Plug 'kana/vim-textobj-function'

Plug 'wellle/targets.vim'  " Operator pending mappings ()[]{}

Plug 'justinmk/vim-sneak'  " s


" ## Git Integration

Plug 'airblade/vim-gitgutter'  " Show git diff on the numbers column
Plug 'tpope/vim-fugitive'  " Git wrapper
Plug 'lambdalisue/gina.vim'  " Asynchronously Git wrapper


" ## Autocompletion

Plug 'neoclide/coc.nvim', {'branch': 'release'}


" ## Snippets

Plug 'honza/vim-snippets'


" ## Themes & Color Schemes

Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'ryanoasis/vim-devicons'  " Show icons on filetypes
Plug 'lifepillar/vim-solarized8'  " Solarized theme
Plug 'mhartington/oceanic-next'


" ## Languages

Plug 'sheerun/vim-polyglot'

" ### HTML

Plug 'valloric/MatchTagAlways'  " Match html tags (colorize tags)
Plug 'alvan/vim-closetag'  " Closes tag after '>'

" ### Python

Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
Plug 'tweekmonster/django-plus.vim'

" ### ReStructuredText

Plug 'stsewd/sphinx.nvim', { 'do': ':UpdateRemotePlugins' }

" ### Vim

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'junegunn/vader.vim'

call plug#end()


" ..........................................................
" # Settings
" ..........................................................

" ## GUI

set title
set mouse=a
set noshowmode
set pumblend=30

set colorcolumn=100  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor

set diffopt+=vertical  " Always use vertical diffs


" ## Lines

set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set nojoinspaces  " Always use one space to join line


" ## Indentation

set tabstop=4
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab


" ## Search & replace

set ignorecase
set smartcase
set gdefault

" Show replace live preview
set inccommand=nosplit


" ## Theme & Colorscheme

set termguicolors  " Active true colors on terminal
set background=light
colorscheme OceanicNext  " solarized8, OceanicNext


" ## Buffers

set hidden  " Allow change buffers without saving


" ## Spellchecker

set spelllang=en,es


" ## Python

" Deactivate python 2 support
let g:loaded_python_provider = 1
let g:python3_host_prog = $NVIM_PYTHON_HOST


" .........................................................
"  # Mappings
" .........................................................

" Map <leader> to space and <localleader> to comma
let g:mapleader = ' '
let g:maplocalleader = ','

" Save
nnoremap <leader>w :w<CR>

" Refresh
nnoremap <leader>e :e!<CR>

" Edit init.vim
nnoremap <leader>i :e $MYVIMRC<CR>

" Clear highlighted
nnoremap <silent> <leader>l :nohlsearch<CR>

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Cut to clipboard
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" Scroll
nnoremap <up> <c-y>
nnoremap <down> <c-e>
nnoremap <right> zl
nnoremap <left> zh

" Search
nnoremap * *N
nnoremap # #N

" Exit terminal mode with escape
tnoremap <Esc> <C-\><C-n>
" Send scape to terminal
tnoremap <A-[> <Esc>

" Copy current path with line number
nnoremap <silent> <leader>o
      \ :let @" = expand('%:p') . ':' . line('.') <bar> echo @"<CR>

" .........................................................
"  # Custom Commands and Autocommands
" .........................................................

" Activate spell
command! -bang Spell setlocal spell<bang> | syntax spell toplevel

" Remove trailing white spaces
command! -range=% RemoveTrailing <line1>,<line2>s/\s\+$//e

" Save current view settings on a per-window, per-buffer basis.
" https://vim.fandom.com/wiki/Avoid_scrolling_when_switch_buffers
function! AutoSaveWinView()
  if !exists("w:SavedBufView")
    let w:SavedBufView = {}
  endif
  let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
  let buf = bufnr("%")
  if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
    let v = winsaveview()
    let atStartOfFile = v.lnum == 1 && v.col == 0
    if atStartOfFile && !&diff
      call winrestview(w:SavedBufView[buf])
    endif
    unlet w:SavedBufView[buf]
  endif
endfunction

autocmd BufLeave * call AutoSaveWinView()
autocmd BufEnter * call AutoRestoreWinView()


augroup CustomTerminalAutoCommand
  " - Start on insert mode
  " - Excecute previous command with <CR>
  " - Don't show line numbers
  autocmd!
  autocmd TermOpen *
        \ startinsert |
        \ noremap <buffer> <CR> a<C-p><CR><C-\><C-n> |
        \ setlocal norelativenumber nonumber
augroup end

" ..........................................................
" # Plugins Settings
" ..........................................................

" ## coc.nvim

let g:coc_global_extensions = [
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
    \]

" Show documentation using K
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if index(['vim', 'help', 'c', 'cpp'], &filetype) >= 0
    normal! K
  else
    call CocAction('doHover')
  endif
endfunction

" Move to prev/next error
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
noremap <leader>gd gd
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Remap for actions
nmap <leader>r <Plug>(coc-rename)

" Jump to floating window
nmap <silent> <C-w><leader> <Plug>(coc-float-jump)

" Refresh completion
inoremap <silent><expr> <C-n> coc#refresh()


" ## Far

let g:far#source = 'rgnvim'
let g:far#auto_delete_replaced_buffers = 1
let g:far#ignore_files = ['.gitignore']


" ## NerdTree

" Minimal UI
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:NERDTreeChDirMode = 2  " Change cwd to parent node
let g:NERDTreeAutoDeleteBuffer = 1

" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$', '^venv$',
    \ '^tags$', 'node_modules', '\.o$'
    \]

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeFind<CR>


" ## Tagbar

let g:tagbar_sort = 0
nnoremap <leader>m :Tagbar<CR>

" ## Airline

" Mappings to change buffer
nmap <leader>j <Plug>AirlineSelectPrevTab
nmap <leader>k <Plug>AirlineSelectNextTab

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#virtualenv#enabled = 0  " Don't show current virtualenv
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'
let g:airline#extensions#hunks#enabled = 0

" Load Powerline font/symbols
let g:airline_powerline_fonts = 1


" ## Gutentags

" Activate only on projects that have a ctags configuration file
let g:gutentags_project_root = ['.ctags']
let g:gutentags_add_default_project_roots = 0

" Filter for files under vcs
let g:gutentags_file_list_command = {
    \ 'markers': { '.git': 'git ls-files | grep -E  "(*.\.c$)|(*.\.h$)|(*.\.py$)"' },
    \ }


" ## GitGutter

set updatetime=100  " Update each 100 mls
let g:gitgutter_terminal_reports_focus = 0


" ## FZF

let g:fzf_command_prefix = 'Fz'
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <silent> <leader>f :call <SID>open_fzf()<CR>

function! s:open_fzf()
  let l:choices = [
    \ ['[f]iles', 'Files'], ['[o]pen buffers', 'Buffers'], ['[l]ines', 'BLines'], ['[r]g', 'Rg'],
    \ ['[c]ommands', 'Commands'], ['git [s]tatus', 'GFiles'], ['[g]it checkout', 'GCheckout'],
    \ ['[h]istory', 'History'], ['history[:]', 'History:'], ['history[/]', 'History/'],
    \]
  let l:options = map(copy(l:choices), 'v:val[0]')
  echo 'Fzf ' . join(l:options, ', ') . ': '
  let l:key = nr2char(getchar())
  let l:match = match(l:options, '\[' . l:key . '\]')
  redraw
  if l:match >= 0
    execute ':' . g:fzf_command_prefix . l:choices[l:match][1]
  endif
endfunction

" Open fzf in a floating window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }


" ## Indentline

let g:indentLine_color_gui = '#4f5b66'

let g:indentLine_bufTypeExclude = ['terminal']
let g:indentLine_fileTypeExclude = [
    \ 'text', 'help', 'man', 'rst', 'vader',
    \ 'markdown', 'startify', 'nerdtree',
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


" ## Snippets

imap <C-j> <Plug>(coc-snippets-expand-jump)


" ## Dev-Icons

let g:webdevicons_enable_nerdtree = 0


" ## Highlightedyank

let g:highlightedyank_highlight_duration = 250


" ## Closetag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*tmpl'


" ## Sneak

let g:sneak#label = 1  " Show labels
let g:sneak#use_ic_scs = 1  " Case insensitive

" Always show labels
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S


" ## Open browser GitHub

nnoremap <leader>go :Gina browse :<CR>
vnoremap <leader>go :Gina browse :<CR>
nnoremap <leader>gO :Gina browse<CR>


" ## Fugitive

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gu :Gread<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gina push<CR>
nnoremap <leader>gP :Gina pull<CR>


" ## Vim-test

let g:test#strategy = 'neovim'
let g:test#custom_runners = {'Python': ['Tox', 'Nox']}

nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tt :TestNearest<CR>


" ## Markdown

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1


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


" ## vim-altr

nmap <leader>a <Plug>(altr-forward)
nmap <leader>A <Plug>(altr-back)


" ## Startify

let g:startify_session_persistence = 1  " Autosave sessions
let g:startify_change_to_vcs_root = 1  " Change cwd to root of git project

let g:startify_custom_header = startify#pad([
    \ '>>> Happy Coding @' . $USER . '!',
    \])

let g:startify_commands = [
    \ {'u': ':PlugUpgrade | PlugUpdate'},
    \]

let g:startify_lists = [
    \ {'type': 'sessions'},
    \ {'type': 'commands'},
    \]
