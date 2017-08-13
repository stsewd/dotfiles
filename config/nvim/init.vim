" .........................................................
" # Plugins
" .........................................................

" Plugins folder
call plug#begin('~/.local/share/nvim/plugged')


" ## General Utilities

Plug 'mhinz/vim-startify'  " Show a start screen
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " Tree explorer
Plug 'vim-airline/vim-airline'  " Status bar & tabline


" ## Editor Utilities

Plug 'matze/vim-move'  " Move lines with Alt+{jk}
Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'google/vim-searchindex'  " Show number of search
Plug 'vim-scripts/matchit.zip'  " Extend % for matching HTML tags
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'scrooloose/nerdcommenter'  " Comment lines easily
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'tpope/vim-unimpaired'  " Handy bracket mappings
Plug 'brooth/far.vim'  " Find and replace


" ## Navigation Utilities

Plug 'ctrlpvim/ctrlp.vim'  " Fuzzy file finder
Plug 'fisadev/vim-ctrlp-cmdpalette'  " Command palette
Plug 'easymotion/vim-easymotion'  " Move quickly on vim
Plug 'majutsushi/tagbar'  " Display tags in a window
Plug 'bronson/vim-visual-star-search'  " Search selected text with */#
Plug 'ludovicchabant/vim-gutentags'  " Automated tag file generation


" ## Other Utilities

Plug 'tpope/vim-eunuch'  " Command line utilities
Plug 'tpope/vim-repeat'  " Extend '.' for repeat scripts actions
Plug 'chrisbra/nrrwrgn'  " Focus & isolate a region (selected text)

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Colored files and icons on nerdtree
Plug 'arkgast/nerdtree-execute', { 'branch': 'standard_linux_opener' }  " Add execute menu to NerdTree


" ## Notes

Plug 'vimwiki/vimwiki'  " Personal wiki in vim
Plug 'Hans-Guenter/TaskList.vim'  " TODO's finder


" ## Text Objects & Motions

Plug 'tommcdo/vim-exchange'  " Exchange operator support
Plug 'chaoren/vim-wordmotion'  " Wordmotion text-object

Plug 'kana/vim-textobj-user'  " Base
Plug 'jceb/vim-textobj-uri'  " URI text object (u)
Plug 'kana/vim-textobj-indent'  " Indentation text object

Plug 'wellle/targets.vim'  " Operator pending mappings


" ## Git Integration

Plug 'tpope/vim-fugitive'  " Git wrapper for vim
Plug 'airblade/vim-gitgutter'  " Show git diff on the numbers column
Plug 'xuyuanp/nerdtree-git-plugin'  " Show git status on nerdtree


" ## Github Integration

Plug 'tyru/open-browser.vim'  " Required by open-browser-github
Plug 'tyru/open-browser-github.vim'  " Open github project, issues, etc.


" ## Autocompletition

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'  " Provides completitions from syntax
Plug 'Shougo/echodoc.vim'  " Show function signature

Plug 'ervandew/supertab'  " User tab for navigate on completitions

Plug 'fszymanski/deoplete-emoji'


" ## Snippets

Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'


" ## Linters & Formatters

Plug 'w0rp/ale'  " Async lint engine
Plug 'Chiel92/vim-autoformat'  " Easy code formatting

Plug 'rhysd/vim-grammarous'  " Grammar checker


" ## Themes & Color Schemes

Plug 'iCyMind/NeoSolarized'  " Solarized theme
Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'ryanoasis/vim-devicons'  " Show icons on nerdtree
Plug 'joshdick/onedark.vim'


" ## Reading & Focus

Plug 'junegunn/goyo.vim'  " Free distraction mode
Plug 'junegunn/limelight.vim'  " Focus blocks


" ## Languages

" ### CSS

Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'ap/vim-css-color', { 'for': 'css' }

" ### Docker

Plug 'ekalinin/dockerfile.vim', { 'for': 'Dockerfile' }

" ### HTML

Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'gregsexton/matchtag'  " Match html tags (colorize tags)
Plug 'othree/html5.vim'  " html5 completition
Plug 'alvan/vim-closetag'  " Closes tag after '>'

" ### JavaScript

Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'elzr/vim-json', { 'for': 'json' }

" ### Jekyll

Plug 'tpope/vim-liquid'
Plug 'parkr/vim-jekyll'

" ### Jinja2

Plug 'Glench/Vim-Jinja2-Syntax'

" ### Markdown

Plug 'godlygeek/tabular'  " Filtrado y alineado de texto
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }  " Markdown preview
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }  " Auto generate TOC

" ### Pandoc

" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'

" ### Python

Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'umutcoskun/vim-mule',  { 'for': 'python' }  " Django helper
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }

" ## TypeScript

Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/vim-js-pretty-template'

" ## Vim

Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'stsewd/open-plugin-page.nvim', { 'for': 'vim', 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/vader.vim', { 'for': 'vim' }


call plug#end()


" ..........................................................
" # Settings
" ..........................................................

" ## GUI

set title
set mouse=a
set noshowmode

set colorcolumn=100  " Set & show limit column
set scrolloff=3  " Display at least 3 lines around you cursor
set sidescroll=1

set diffopt+=vertical  " Always use vertical diffs


" ## Lines

set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set linespace=2  " Pixels between lines
set foldlevelstart=99  " Don't fold when open buffer


" ## Indentation

set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set smartindent


" ## Search & replace

set ignorecase
set smartcase

" Show replace live preview
set inccommand=nosplit


" ## Theme & Colorscheme

set termguicolors  " Active true colors on terminal
set background=light
colorscheme NeoSolarized  " NeoSolarized, onedark


" ## Buffers

set hidden  " Allow change buffers without saving


" ## Spellchecker

set spelllang=en,es
set complete+=kspell  " Autocomplete with dictionary words


" .........................................................
"  # Mappings
" .........................................................

" Map <Leader> to space
let g:mapleader = ' '

" Save
nnoremap <leader>s :w<CR>

" Edit init.vim
nnoremap <leader>e :e $MYVIMRC<CR>

" Esc
inoremap jk <esc>

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

" Active ctrlp-command-palette
nnoremap <C-A-p> :CtrlPCmdPalette<CR>
vnoremap <C-A-p> :CtrlPCmdPalette<CR>

" Insert new line on normal mode with Alt+Enter
nnoremap <M-Enter> o<Esc>

" Toggle nerdtree with F2
map <F2> :NERDTreeToggle<CR>

" Toggle indentline with F3
map <F3> :IndentLinesToggle<CR>

" View plugin page
nnoremap gp :OpenPluginPage<CR>


" ..........................................................
" # Plugins Settings
" ..........................................................

" ## Deoplete

let g:deoplete#enable_at_startup = 1

" Autoclose preview window
augroup deopleteCompleteDone
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

let g:deoplete#sources#jedi#show_docstring = 1


" ## Echodoc

let g:echodoc_enable_at_startup = 1


" ## Supertab

" Invert tab direction
let g:SuperTabDefaultCompletionType = '<c-n>'


" ## ALE

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_fixers = {
    \ 'javascript': 'eslint'
    \}


" ## Vim-grammarous

let g:grammarous#default_comments_only_filetypes = {
    \ '*': 1, 'help': 0, 'markdown': 0, 'liquid': 0
    \}

" ## NerdTree

let g:NERDTreeChDirMode = 2  " Change cwd to parent node

" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$', '^venv$',
    \ '^tags$'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1


" ## Airline

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename

" Load Powerline font/symbols
let g:airline_powerline_fonts = 1

" ale integration
let g:airline#extensions#ale#enabled = 1


" ## Emoji

call deoplete#custom#set('emoji', 'filetypes', ['gitcommit', 'markdown', 'liquid'])


" ## Gutentags

let g:gutentags_ctags_tagfile = '.tags'


" ## CtrlP

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'

" Ignored files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Ignore files on .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" ## GitGutter

set updatetime=250  " Update each 250 mls


" ## The NerdCommenter

let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting


" ## Emmet

let g:user_emmet_leader_key = '<C-Z>'  " Trigger emmet with <ctrl-z ,>


" ## Indentline

let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Deactivate on completition, to slow
augroup indent_line
  autocmd!
  autocmd InsertEnter * IndentLinesDisable
  autocmd InsertLeave * IndentLinesEnable
augroup END


" ## Vim-Closetag

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.md'


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


" ## Vimwiki

" Markdown as default syntax
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki.md'}]


" ## Markdown

let g:vim_markdown_conceal = 0  " Do not hide symbols
let g:vim_markdown_no_default_key_mappings = 1


" ## Vim-Pandoc

" let g:pandoc#syntax#conceal#use = 0  " Do not hide symbols
" let g:pandoc#folding#fdc = 0  " Do not show folding numbers
" let g:pandoc#modules#disabled = ['folding']  " Folding module make vim slow!


" ## vim-js-pretty-template
augroup js_pretty_template
  autocmd!
  autocmd FileType typescript JsPreTmpl html
  autocmd FileType javascript JsPreTmpl html
  autocmd FileType typescript syn clear foldBraces
augroup END


" ## Goyo & Limelight
augroup goyo
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END


" ## Startify

let g:startify_change_to_vcs_root = 1  " Change cwd to root of git project
let g:startify_files_number = 5  " Show just 5 files on MRU
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']

let g:startify_session_persistence = 1  " Autosave sessions
let g:startify_session_sort = 0  " List sessions by modification time
let g:startify_session_delete_buffers = 1  " Delete open buffer before load session

let g:startify_custom_header = []  " Disable header
