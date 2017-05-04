" .........................................................
" # Vim-Plug
" .........................................................

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" ## General & Utilities
Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'vim-airline/vim-airline'  " Status bar & tabline
Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'mhinz/vim-startify'  " Show a start screen
Plug 'google/vim-searchindex'  " Show number of search
Plug 'terryma/vim-smooth-scroll'  " More natural scroll
Plug 'matze/vim-move'  " Move lines with Alt+{jk}

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
Plug 'arkgast/nerdtree-execute', { 'branch': 'standard_linux_opener' }  " Add execute menu to NerdTree

Plug 'vimwiki/vimwiki'  " Personal wiki in vim
Plug 'Hans-Guenter/TaskList.vim'  " TODO's finder


" ## Text Objects
Plug 'tommcdo/vim-exchange'  " Exchange operator support
Plug 'chaoren/vim-wordmotion'  " Wordmotion text-object

Plug 'kana/vim-textobj-user'  " Base
Plug 'jceb/vim-textobj-uri'  " URI text motion (u)


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

Plug 'xolox/vim-misc'  " Required by vim-easytags
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


" ## CSS
Plug 'ap/vim-css-color'


" ## JavaScript
Plug 'elzr/vim-json'


" ## TypeScript
Plug 'leafgarland/typescript-vim' 
Plug 'Quramy/vim-js-pretty-template'


" ## PHP
Plug 'shawncplus/phpcomplete.vim'


" ## Docker
Plug 'ekalinin/dockerfile.vim'


" ## Python
Plug 'tweekmonster/braceless.vim'  " Add P text object for functions
" Plug 'python-mode/python-mode'

" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'


" ## Markdown
Plug 'godlygeek/tabular'  " Filtrado y alineado de texto
Plug 'plasticboy/vim-markdown'  " Markdown
Plug 'shime/vim-livedown'  " Markdown preview
Plug 'mzlogin/vim-markdown-toc'  " Auto generate TOC


" ## Pandoc
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'


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

set diffopt+=vertical  " Always use vertical diffs


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


" ## Search
set ignorecase
set smartcase


" ## Theme & Colorscheme
set termguicolors  " Active true colors on terminal (deactive on solarized)
set background=light
colorscheme onedark  " solarized, onedark
hi clear CursorLineNr  " Clear highlighting line number


" ## Buffers
set hidden  " Allow change buffers without saving


" ## Spellchecker
set spelllang=en,es
set complete+=kspell  " Autocomplete with dictionary words


" .........................................................
" " # Key-Bindings
" " .........................................................

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

" Exit terminal mode with escape
tnoremap <Esc> <C-\><C-n>

" Search on buffers with ctrl-p
nnoremap <silent> <leader>r :CtrlPBuffer<CR>

" Active ctrlp-command-palette
nnoremap <C-A-p> :CtrlPCmdPalette<CR>
vnoremap <C-A-p> :CtrlPCmdPalette<CR>

" Insert new line on normal mode with alt+enter
nmap <A-Enter> o<Esc>

" Toggle nerdtree with F2
map <F2> :NERDTreeToggle<CR>


" ..........................................................
" # Plugins Settings
" ..........................................................

" ## NerdTree
let g:NERDTreeChDirMode = 2  " Change cwd to parent node
" Ignored files
let NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$', '^venv$',
    \ '^tags$'
    \]


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
let g:user_emmet_leader_key = '<C-Z>'  " Trigger emmet with ctrl-z ,


" ## Vim-Closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'


" ## Ultisnips
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'


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

" Saves tags file on cwd
set cpoptions+=d
set tags=./.tags;
let g:easytags_dynamic_files = 2


" ## Syntastic
let g:syntastic_loc_list_height = 5  " Set height of errors window


" ## Vimwiki
" Markdown as default syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki.md'}]


" ## YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1  " Autoclose preview window after insert
let g:ftplugin_sql_omni_key = '<C-j>'  " Do not use ctrl-c
let g:ycm_filetype_blacklist = {}  " Allow autocompletition anywhere!


" ## Braceless
autocmd FileType python BracelessEnable +indent +fold


" ## Markdown
let g:vim_markdown_conceal = 0  " Do not hide symbols
let g:vim_markdown_no_default_key_mappings = 1


" ## Vim-Pandoc
" let g:pandoc#syntax#conceal#use = 0  " Do not hide symbols
" let g:pandoc#folding#fdc = 0  " Do not show folding numbers
" let g:pandoc#modules#disabled = ['folding', 'spell']  " Folding module make vim slow!


" ## vim-js-pretty-template
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces


" ## Goyo & Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ## vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" ## Startify
let g:startify_change_to_vcs_root = 1  " Change cwd to root of git project
let g:startify_files_number = 5  " Show just 5 files on MRU
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']

let g:startify_session_persistence = 1  " Autosave sessions
let g:startify_session_sort = 0  " List sessions by modification time
let g:startify_session_delete_buffers = 1  " Delete open buffer before load session

let g:startify_custom_header = []  " Disable header


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
" ## Install markdown preview
" - npm install -g livedown
"
