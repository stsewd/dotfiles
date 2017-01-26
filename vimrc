" Cancel the compatibility with Vi.
set nocompatible


" .........................................................
" # Vim-Plug
" .........................................................

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" ## General & Utilities
Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'mhinz/vim-startify'  " Show a start screen

Plug 'ctrlpvim/ctrlp.vim'  " Fuzzy file finder
Plug 'fisadev/vim-ctrlp-cmdpalette'  " Command palette
Plug 'easymotion/vim-easymotion'  " Move quickly on vim
Plug 'majutsushi/tagbar'  " Display tags in a window

Plug 'danro/rename.vim'  " Rename current open file/buffer
Plug 'matchit.zip'  " Extend % for matching HTML tags
Plug 'tpope/vim-repeat'  " Extend . for repeat scripts actions

Plug 'jeetsukumaran/vim-buffergator'  " Navigate between buffers (gb)

Plug 'chrisbra/nrrwrgn'  " Focus & isolate a region (selected text)

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Colored files and icons on nerdtree
Plug 'ivalkeen/nerdtree-execute'  " Add execute menu to NerdTree

Plug 'vimwiki/vimwiki'  " Personal wiki in vim
Plug 'Hans-Guenter/TaskList.vim'  " TODO's finder

Plug 'tommcdo/vim-exchange'  " Exchange operator support
Plug 'chaoren/vim-wordmotion'  " Wordmotion text-object


" ## Git Integration
Plug 'tpope/vim-fugitive'  " Git wrapper for vim
Plug 'airblade/vim-gitgutter'  " Show git diff on the numbers column
Plug 'xuyuanp/nerdtree-git-plugin'  " Show git status on nerdtree

 
" ## Github Integration
Plug 'tyru/open-browser.vim'  " Required by open-browser-github
Plug 'tyru/open-browser-github.vim'  " Open github project, issues, etc.


" ## Autocompletition & Snippets
Plug 'valloric/youcompleteme'

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

Plug 'xolox/vim-misc'  " Required by vim-easytags & vim-session
Plug 'xolox/vim-easytags'  " Automated tag file generation & highlighting


" ## Linters & Formatters
Plug 'scrooloose/syntastic'  " Syntax checking
Plug 'Chiel92/vim-autoformat'  " Easy code formatting
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'scrooloose/nerdcommenter'  " Comment lines easily
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.


" ## Themes & Color Schemes
Plug 'altercation/vim-colors-solarized'  " Solarized theme
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'ryanoasis/vim-devicons'  " Show icons on nerdtree
Plug 'joshdick/onedark.vim'


" ## HTML
Plug 'mattn/emmet-vim'  " Emmet
Plug 'gregsexton/matchtag'  " Match html tags (colorize tags)
Plug 'othree/html5.vim'  " html5 completition
Plug 'alvan/vim-closetag'  " Closes tag after >


" ## Javascript
Plug 'elzr/vim-json' 


" ## PHP
Plug 'shawncplus/phpcomplete.vim'


" ## Docker
Plug 'ekalinin/dockerfile.vim'


" ## Python

" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'


" ## Markdown
Plug 'godlygeek/tabular'  " Filtrado y alineado de texto
Plug 'plasticboy/vim-markdown'  " Markdown
Plug 'shime/vim-livedown'  " Markdown preview


" ## Pandoc
" Plugin 'vim-pandoc/vim-pandoc'
" Plugin 'vim-pandoc/vim-pandoc-syntax' 


" ## Reading & Focus
Plug 'junegunn/goyo.vim'  " Free distraction mode
Plug 'junegunn/limelight.vim'  " Focus blocks


call plug#end()


" .........................................................
" # Settings
" .........................................................

" ## GUI
set title  " Update the title of your window or your terminal
set mouse=a  " Enable mouse support in terminal

set scrolloff=3  " Display at least 3 lines around the cursor
set colorcolumn=120  " Set & show limit column
set encoding=utf8  " Set enconding

set diffopt+=vertical  " Always use vertical diffs
set laststatus=2  " Always show status bar


" ## Lines
set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set ruler  " Display cursor position
set linespace=2  " Pixels between lines
set foldlevelstart=99  " Don't fold when open buffer


" ## Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent


" ## Search
set ignorecase
set smartcase

set incsearch  " Highlight search results when typing
set hlsearch   " Highlight search results


" ## Ex-mode
set wildmenu  " Tab completition on exmode


" ## Beep
set visualbell  " Prevent Vim from beeping
set noerrorbells  " Prevent Vim from beeping


" ## Theme & Colorscheme
set termguicolors  " Active true colors on terminal (deactive on solarized)
set background=light
colorscheme onedark  " solarized, onedark
hi clear CursorLineNr  " Clear highlighting line number


" ## Buffers
set autoread " Reload files changed outside vim
set hidden  " Allow change buffers without saving


" ## Backup
set backup
" Move .swp files to tmp/
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" ## Spellchecker
set spelllang=en,es
set complete+=kspell  " Autocomplete with dictionary words


" ## Others
set backspace=2  " make backspace work like most other apps


" .........................................................
" # Key-Bindings
" .........................................................

" Map <Leader> to space
let mapleader = " "

" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Paste from clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" Move to the next buffer
nnoremap <leader>l :bnext<CR>

" Move to the previous buffer
nnoremap <leader>j :bprevious<CR>

" Close current buffer
nnoremap <leader>q :bdelete<CR>

" Hide current buffer
nnoremap <leader>h :hide<CR>

" Disable highlighting search with ctrl-c or escape
nnoremap <esc> :noh<CR>
nnoremap <C-c> :noh<CR>

" Search on buffers with ctrl-p
nnoremap <silent> <leader>r :CtrlPBuffer<CR>


" .........................................................
" # Plugins Settings
" .........................................................

" ## NerdTree
let g:NERDTreeChDirMode = 2  " Change cwd to parent node
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']  " Ignore python cache files


" ## Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_balloons = 0  " Disable balloons, too slow! 

let g:syntastic_python_checkers = ["flake8"]

" Symbols
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '⚠️'


" ## Airline
let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

" Load Powerline font/symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" ## CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" ## GitGutter
set updatetime=250  " Update each 250 mls


" ## The NerdCommenter
let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting


" ## Emmet
let g:user_emmet_leader_key='<C-Z>'  " Trigger emmet with ctrl-z ,


" ## Vim-Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"


" ## Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" ## Dev-Icons
" Show folders icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Adjust icons padding
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '


" ## Easytags
" Async updates
let g:easytags_async = 1

" Update on open & write
let g:easytags_events = ['BufReadPost', 'BufWritePost']

" Saves .tags file on cwd
set cpoptions+=d
set tags=./.tags;
let g:easytags_dynamic_files = 2


" ## Syntastic
let g:syntastic_loc_list_height=5  " Set height of errors window


" ## Vimwiki
" Markdown as default syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki.md'}]


" ## YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1  " Autoclose preview window after insert
let g:EclimCompletionMethod = 'omnifunc'  " Set eclim compatible with ycm


" ## Python-mode
" let g:pymode_python = 'python3'
" let g:pymode_lint = 0  " Don't use linter, we have syntastic
" let g:pymode_rope = 0  " Don't load rope
" let g:pymode_folding = 0  " Don't fold python code on open


" ## Markdown
let g:vim_markdown_conceal = 0  " Do not hide symbols


" ## Vim-Pandoc
" let g:pandoc#syntax#conceal#use = 0  " Do not hide symbols
" let g:pandoc#folding#fdc = 0  " Do not show folding numbers
" let g:pandoc#modules#disabled = ['folding', 'spell']  " Folding module make vim slow!


" ## Goyo & Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ## Startify
let g:startify_change_to_vcs_root = 1  " Change cwd to root of git project
let g:startify_files_number = 5  " Show just 5 files on MRU
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']

let g:startify_session_persistence = 1  " Autosave sessions
let g:startify_session_sort = 0  " List sessions by modification time
let g:startify_session_delete_buffers = 1  " Delete open buffer before load session

let g:ascii = [
    \ '              .::::::::::.              ',
    \ '            .::``::::::::::.            ',
    \ '            :::..:::::::::::            ',
    \ '            ````````::::::::            ',
    \ '    .::::::::::::::::::::::: iiiiiii,   ',
    \ ' .:::::::::::::::::::::::::: iiiiiiiii. ',
    \ ' ::::::::::::::::::::::::::: iiiiiiiiii ',
    \ ' ::::::::::::::::::::::::::: iiiiiiiiii ',
    \ ' :::::::::: ,,,,,,,,,,,,,,,,,iiiiiiiiii ',
    \ ' :::::::::: iiiiiiiiiiiiiiiiiiiiiiiiiii ',
    \ ' `::::::::: iiiiiiiiiiiiiiiiiiiiiiiiii` ',
    \ '    `:::::: iiiiiiiiiiiiiiiiiiiiiii`    ',
    \ '            iiiiiiii,,,,,,,,            ',
    \ '            iiiiiiiiiii''iii            ',
    \ '            `iiiiiiiiii..ii`            ',
    \ '              `iiiiiiiiii`              ',
    \ ''
    \]
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header(g:ascii)
