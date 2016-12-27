" .........................................................
" # Vim-Plug
" .........................................................

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" ## General & Utilities
Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'yggdroot/indentline'  " Show indentation lines

Plug 'ctrlpvim/ctrlp.vim'  " Fuzzy file finder
Plug 'easymotion/vim-easymotion'  " Move quickly on vim
Plug 'majutsushi/tagbar'  " Display tags in a window

Plug 'danro/rename.vim'  " Rename current open file/buffer
Plug 'matchit.zip'  " Extend % for matching HTML tags
Plug 'tpope/vim-repeat'  " Extend . for repeat scripts actions

Plug 'jeetsukumaran/vim-buffergator'  " Navigate between buffers (gb)
Plug 'xolox/vim-session'  " Manage vim sessions automatically

Plug 'chrisbra/nrrwrgn'  " Focus & isolate a region (selected text)

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Colored files and icons on nerdtree
Plug 'ivalkeen/nerdtree-execute'  " Add execute menu to NerdTree

Plug 'vimwiki/vimwiki'  " Personal wiki in vim

Plug 'tommcdo/vim-exchange'  " Exchange operator support


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


" ## PHP
Plug 'shawncplus/phpcomplete.vim'


" ## Docker
Plug 'ekalinin/dockerfile.vim'


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


" ..........................................................
" # Settings
" ..........................................................

" ## GUI
set title
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1  " Makes the cursor a pipe in insert-mode

set colorcolumn=120  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor


" ## Lines
set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set ruler  " Display cursor position
set linespace=2  " Pixels between lines


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


" ## Theme & Colorscheme
" let g:solarized_terkcolors=256  " Use if not solarized theme is on terminal
set termguicolors  " Active true colors on terminal
set background=light
colorscheme onedark  " solarized, onedark
hi clear CursorLineNr  " Clear highlighting line number


" ## Indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent


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


" .........................................................
" " # Key-Bindings
" " .........................................................

" Map <Leader> to space
let mapleader = " "

" Copy to clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

" Paste from clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

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


" ..........................................................
" # Plugins Settings
" ..........................................................

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


" ## Airline
set laststatus=2  " Always show

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

" Load Powerline font/symbols
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" ## CtrlP
let g:ctrlp_working_path_mode = 'ac'
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


" ## Session
let g:session_autosave="yes"  " Autosave session
let g:session_default_to_last = 1  " Autoload las saved session
let g:session_autoload="yes"  " Autoload last saved session

" Do not reload gui settings
let g:session_persist_font = 0
let g:session_persist_colors = 0


" ## Markdown
let g:vim_markdown_conceal = 0  " Do not hide symbols


" ## Vim-Pandoc
" let g:pandoc#syntax#conceal#use = 0  " Do not hide symbols
" let g:pandoc#folding#fdc = 0  " Do not show folding numbers
" let g:pandoc#modules#disabled = ['folding', 'spell']  " Folding module make vim slow!


" ## Goyo & Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ..........................................................
" # Instructions
" ..........................................................
"
" ## Install Vim-Plug
" - See the instructions on <https://github.com/junegunn/vim-plug>
"
" ## Install Plugins
" - :PlugInstall
"
" ## Install pathched fonts
" - Download one from <https://github.com/ryanoasis/nerd-fonts>
" - Recomended: <https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20for%20Powerline%20Nerd%20Font%20Complete%20Mono.ttf>
" - Select that font on your terminal configurations
"
" ## Install ctags
" - Ubuntu: apt install exuberant-ctags
" - Fedora: dnf install ctags
"
" ## Compile YouCompleteMe
" See instructions on :h youcompleteme-installation
"
" ## Install one-dark profile
" For greater compatibility with one-dark theme
" install <https://github.com/denysdovhan/one-gnome-terminal>.
"
