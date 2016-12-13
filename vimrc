" Cancel the compatibility with Vi.
set nocompatible


" .........................................................
" # Vundle
" .........................................................

filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" ## General & Utilities
Plugin 'VundleVim/Vundle.vim'  " Plugin manager

Plugin 'scrooloose/nerdtree'  " Tree explorer
Plugin 'vim-airline/vim-airline'  " Status bar & tabline
Plugin 'yggdroot/indentline'  " Show indentation lines

Plugin 'xolox/vim-session'  " Manage vim sessions automatically
Plugin 'xolox/vim-misc'  " Required by vim-session

Plugin 'ctrlpvim/ctrlp.vim'  " Fuzzy file finder
Plugin 'easymotion/vim-easymotion'  " Move quickly on vim
Plugin 'majutsushi/tagbar'  " Display tags in a window

Plugin 'danro/rename.vim'  " Rename current open file/buffer
Plugin 'matchit.zip'  " Extend % for matching HTML tags
Plugin 'tpope/vim-repeat'  " Extend . for repeat scripts actions

Plugin 'Shougo/vimproc.vim'  " Interactive command execution
Plugin 'shougo/vimshell.vim'  " Open a shell on vim

Plugin 'jeetsukumaran/vim-buffergator'  " Navigate between buffers (gb)

Plugin 'tpope/vim-dispatch'  " Async vim

Plugin 'chrisbra/nrrwrgn'  " Focus & isolate a region (selected text)

" Problem: show half icons
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'  " Colored files and icons on nerdtree

Plugin 'ivalkeen/nerdtree-execute'  " Add execute menu to NerdTree


" ## Git Integration
Plugin 'tpope/vim-fugitive'  " Git wrapper for vim
Plugin 'airblade/vim-gitgutter'  " Show git diff on the numbers column
Plugin 'xuyuanp/nerdtree-git-plugin'  " Show git status on nerdtree
Plugin 'octref/rootignore'  " Set wildignore from .gitignore file


" ## Autocompletition & Snippets
Plugin 'valloric/youcompleteme'

Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'xolox/vim-easytags'  " Automated tag file generation & highlighting


" ## Linters & Formatters
Plugin 'scrooloose/syntastic'  " Syntax checking
Plugin 'Chiel92/vim-autoformat'  " Easy code formatting
Plugin 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plugin 'scrooloose/nerdcommenter'  " Comment lines easily
Plugin 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.


" ## Themes & Color Schemes
Plugin 'altercation/vim-colors-solarized'  " Solarized theme
Plugin 'vim-airline/vim-airline-themes'  " Themes for airline
Plugin 'ryanoasis/vim-devicons'  " Show icons on nerdtree
" Plugin 'flazz/vim-colorschemes'  " Several colorschemes


" ## HTML
Plugin 'mattn/emmet-vim'  " Emmet
Plugin 'gregsexton/matchtag'  " Match html tags (colorize tags)
Plugin 'othree/html5.vim'  " html5 completition
Plugin 'alvan/vim-closetag'  " Closes tag after >


" ## PHP
Plugin 'shawncplus/phpcomplete.vim'


" ## Docker
Plugin 'ekalinin/dockerfile.vim'


" ## Markdown
Plugin 'godlygeek/tabular'  " Filtrado y alineado de texto
Plugin 'plasticboy/vim-markdown'  " Markdown
Plugin 'shime/vim-livedown'  " Markdown preview


call vundle#end()
filetype plugin indent on


" .........................................................
" # Settings
" .........................................................

" ## GUI
set title  " Update the title of your window or your terminal
set mouse=a  " Enable mouse support in terminal

set guioptions-=T  " Disable the toolbar
set guioptions-=m  " Disable the menubar
set guioptions-=r  " Remove right-hand scroll bar
set guioptions-=L  " Remove left-hand scroll bar

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set antialias

set gcr=n:blinkon0  " Disable cursor blinking

set scrolloff=3  " Display at least 3 lines around you cursor
syntax enable  " Enable syntax highlighting
set encoding=utf8  " Set enconding


" ## Lines
set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set ruler  " Display cursor position
set linespace=2  " Pixels between lines


" ## Ex-mode
set wildmode=longest:list,full  " Smart tab completion from command line


" ## Buffers
set autoread " Reload files changed outside vim
set hidden  " Allow change buffers without saving


" ## Search
set ignorecase
set smartcase

set incsearch  " Highlight search results when typing
set hlsearch   " Highlight search results


" ## Beep
set visualbell  " Prevent Vim from beeping
set noerrorbells  " Prevent Vim from beeping


" ## Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent


" ## Theme & Colorscheme
let g:solarized_termcolors=256
set background=light
colorscheme solarized
hi clear CursorLineNr  " Clear highlighting line number


" ## Backup
set backup
" Move .swp files to tmp/
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


" ## Spellchecker
set spelllang=en,es


" ## Others
let g:netrw_browsex_viewer="setsid xdg-open"  " Fix gx in gvim


" .........................................................
" # Key-Bindings
" .........................................................

" Map <Leader> to space
let mapleader = " "

" Copy to clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" Paste from clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

" Press enter/shift+enter for inserting a new line on normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Move lines with Alt+{jk}
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Move to the next buffer
nnoremap <leader>l :bnext<CR>

" Move to the previous buffer
nnoremap <leader>j :bprevious<CR>

" Close current buffer
nnoremap <leader>q :bdelete<CR>

" Disable highlighting search with ctrl-c or escape
nnoremap <esc> :noh<CR>
nnoremap <C-c> :noh<CR>


" .........................................................
" # Plugins Settings
" .........................................................

" ## Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ## NerdTree
let g:NERDTreeChDirMode = 2  " Change cwd to parent node
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']  " Ignore python cache files
let NERDTreeRespectWildIgnore=1  " Respect the vim wildignore setting


" ## CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ac'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']


" ## GitGutter
set updatetime=250  " Update each 250 mls


" ## The NerdCommenter
let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting


" ## Airline
set laststatus=2  " Always show

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

" Load Powerline font/symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" ## Emmet
let g:user_emmet_leader_key='<C-Z>'  " Trigger emmet with ctrl-z ,


" ## Session
let g:session_autosave="yes"  " Autosave session
let g:session_autoload="yes"  " Autoload last saved session


" ## Vimshell
" Change prompt
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = '$ '


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
let g:syntastic_loc_list_height=5  " Height of errors window


" ## Rootignore
" TODO: doesn't work
let g:RootIgnoreAgignore = 1  " Load wildignore from .gitignore

" # TODO
" http://vimawesome.com/plugin/vimwiki-the-lucky-one
" Search for todo list manager or make my own plugin

