" .........................................................
" # Plugins
" .........................................................

" Plugins folder
call plug#begin('~/.local/share/nvim/plugged')


" ## General Utilities

Plug 'mhinz/vim-startify'  " Show a start screen
Plug 'vim-airline/vim-airline'  " Status bar & tabline


" ## Editor Utilities

Plug 'matze/vim-move'  " Move lines with Alt+{jk}
Plug 'yggdroot/indentline'  " Show indentation lines
Plug 'google/vim-searchindex'  " Show number of search
Plug 'tpope/vim-surround'  " Surround easily text with quotes, parentheses, etc.
Plug 'scrooloose/nerdcommenter'  " Comment lines easily
Plug 'jiangmiao/auto-pairs'  " Autopair quotes, parentheses, etc.
Plug 'tpope/vim-unimpaired'  " Handy bracket mappings
Plug 'haya14busa/incsearch.vim'  " Better incsearch
Plug 'machakann/vim-highlightedyank' " Highlight yanked text
Plug 'tpope/vim-repeat'  " Extend '.' for repeat scripts actions
Plug 'tpope/vim-eunuch'  " Command line utilities
Plug 'chrisbra/nrrwrgn'  " Focus & isolate a region (selected text)


" ## Navigation Utilities

Plug 'scrooloose/nerdtree'  " Tree explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'  " Colored files and icons on nerdtree
Plug 'arkgast/nerdtree-execute', { 'branch': 'standard_linux_opener' }  " Add execute menu to NerdTree
Plug 'xuyuanp/nerdtree-git-plugin'  " Show git status on nerdtree

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " General fuzzy finder

Plug 'ludovicchabant/vim-gutentags'  " Automated tag file generation
Plug 'majutsushi/tagbar'  " Display tags in a window
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }  " Close/hide/delete current buffer


" ## Other Utilities

Plug 'janko-m/vim-test' " Tests execution
Plug 'kassio/neoterm'  " Terminal wrapper
Plug 'vimwiki/vimwiki'  " Personal wiki in vim
Plug 'stsewd/spotify.nvim', { 'do': ':UpdateRemotePlugins' }  " Control Spotify


" ## Text Objects & Motions

Plug 'chaoren/vim-wordmotion'  " Wordmotion text-object

Plug 'kana/vim-textobj-user'  " Base
Plug 'jceb/vim-textobj-uri'  " URI text object (u)
Plug 'kana/vim-textobj-indent'  " Indentation text object (i)

Plug 'wellle/targets.vim'  " Operator pending mappings ()[]{}

Plug 'justinmk/vim-sneak'  " s


" ## Git Integration

Plug 'tpope/vim-fugitive'  " Git wrapper
Plug 'junegunn/gv.vim'  " Git log
Plug 'airblade/vim-gitgutter'  " Show git diff on the numbers column


" ## Github Integration

Plug 'tyru/open-browser.vim'  " Required by open-browser-github
Plug 'tyru/open-browser-github.vim'  " Open github project, issues, etc.


" ## Autocompletion

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

Plug 'vim-airline/vim-airline-themes'  " Themes for airline
Plug 'ryanoasis/vim-devicons'  " Show icons on filetypes
Plug 'iCyMind/NeoSolarized'  " Solarized theme
Plug 'trevordmiller/nova-vim'


" ## Reading & Focus

Plug 'junegunn/goyo.vim'  " Free distraction mode
Plug 'junegunn/limelight.vim'  " Focus blocks


" ## Languages

Plug 'sheerun/vim-polyglot'

" ### C/C++

Plug 'tweekmonster/deoplete-clang2'
Plug 'kana/vim-altr'

" ### CSS

Plug 'ap/vim-css-color', { 'for': 'css' }

" ### HTML

Plug 'valloric/MatchTagAlways'  " Match html tags (colorize tags)
Plug 'alvan/vim-closetag'  " Closes tag after '>'

" ### JavaScript

Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim'

" ### Jekyll

Plug 'parkr/vim-jekyll'

" ### Log

Plug 'dzeban/vim-log-syntax'

" ### Markdown

Plug 'godlygeek/tabular'  " Filtrado y alineado de texto
Plug 'plasticboy/vim-markdown'
Plug 'shime/vim-livedown', { 'for': 'markdown' }  " Markdown preview
Plug 'mzlogin/vim-markdown-toc', { 'for': 'markdown' }  " Auto generate TOC

" ### Python

Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'bps/vim-textobj-python', { 'for': 'python' }
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
Plug 'tweekmonster/django-plus.vim'

" ### reStructuredText

Plug 'Rykka/riv.vim', { 'for': 'rst' }

" ### TypeScript

Plug 'mhartington/nvim-typescript', { 'for': 'typescript' }

" ### Vim

Plug 'Shougo/neco-vim'
Plug 'stsewd/open-plugin-page.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/vader.vim'


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

set diffopt+=vertical  " Always use vertical diffs


" ## Lines

set nowrap  " No wrap lines (display long lines)
set number  " Display line numbers
set relativenumber  " Show relative line numbers
set cursorline  " Highlight current line
set foldlevelstart=99  " Don't fold when open buffer


" ## Indentation

set tabstop=4
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab


" ## Search & replace

set ignorecase
set smartcase

" Show replace live preview
set inccommand=nosplit


" ## Theme & Colorscheme

set termguicolors  " Active true colors on terminal
set background=light
colorscheme nova  " NeoSolarized, nova


" ## Buffers

set hidden  " Allow change buffers without saving


" ## Spellchecker

set spelllang=en,es
set complete+=kspell  " Autocomplete with dictionary words


" ## Python

let b:pyenv_path = expand('~/.pyenv/versions')

let g:python3_host_prog = b:pyenv_path . '/neovim3/bin/python'
let g:python_host_prog = b:pyenv_path . '/neovim2/bin/python'


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
tmap jk <esc>

" Clear highlighted
nnoremap <silent> <C-l> :nohlsearch<CR>

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

" Move to the next/prev buffer
nnoremap <leader>l :bnext<CR>
nnoremap <leader>j :bprevious<CR>

" Exit terminal mode with escape
tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert


" ..........................................................
" # Plugins Settings
" ..........................................................

" ## Polyglot

let g:polyglot_disabled = [
    \ 'markdown'
    \]


" ## Deoplete

let g:deoplete#enable_at_startup = 1

" Autoclose preview window
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END

" ### Emoji

call deoplete#custom#source(
    \ 'emoji',
    \ 'min_pattern_length', 0
    \)

" ### Jedi

let g:deoplete#sources#jedi#show_docstring = 1
let g:jedi#completions_enabled = 0  " Already provided by deoplete

" ### Ternjs

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1


" ## Ternjs

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']


" ## Echodoc

let g:echodoc_enable_at_startup = 1


" ## Supertab

" Invert tab direction
let g:SuperTabDefaultCompletionType = '<c-n>'


" ## ALE

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'javascript': ['eslint']
    \}


" ## Vim-grammarous

let g:grammarous#default_comments_only_filetypes = {
    \ '*': 1, 'help': 0, 'markdown': 0,
    \ 'liquid': 0, 'rst': 0
    \}


" ## NerdTree

let g:NERDTreeChDirMode = 2  " Change cwd to parent node

" Ignored files
let g:NERDTreeIgnore = [
    \ '\.pyc$', '^__pycache__$', '^venv$',
    \ '^tags$', 'node_modules'
    \]

let g:NERDTreeMinimalUI = 1  " Hide help text
let g:NERDTreeAutoDeleteBuffer = 1

" Too slow when scrolling
let g:NERDTreeLimitedSyntax = 1

map <C-n> :NERDTreeToggle<CR>


" ## Airline

let g:airline#extensions#tabline#enabled = 1  " Show open buffers/tabs
let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#enabled = 0  " Disable whitespace extension
let g:airline#extensions#tagbar#enabled = 0  " Disable tagbar integration

" Load Powerline font/symbols
let g:airline_powerline_fonts = 1

" ale integration
let g:airline#extensions#ale#enabled = 1


" ## Gutentags

let g:gutentags_enabled = 0  " Too slow on big projects


" ## GitGutter

set updatetime=250  " Update each 250 mls


" ## The NerdCommenter

let g:NERDSpaceDelims = 1  " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1  " Enable trimming of trailing whitespace when uncommenting


" ## Incsearch

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

let g:incsearch#auto_nohlsearch = 1


" ## FZF

let g:fzf_command_prefix = 'Fz'
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'

nnoremap <C-p> :FzFiles<CR>

function! s:set_fzf_maps()
  let l:commands = {
    \ 'Files': 'b', 'Buffers': 'f', 'GFiles?': 's', 'Ag': 'g',
    \ 'BLines': 'l', 'History': 'o', 'Commands': 'c', 'Helptags': 'h',
    \ 'BTags': 't', 'GCheckout': 'e'
    \}
  for [l:command, l:map] in items(l:commands)
    execute 'tnoremap <buffer> <C-'. l:map .'> '.
          \ '<C-\><C-n>:close<CR>:sleep 50m<CR>'.
          \ ':Fz'. l:command .'<CR>'
  endfor
endfunction

augroup fzfMappingsAu
  autocmd!
  autocmd FileType fzf call <SID>set_fzf_maps()
augroup END

function! s:open_branch_fzf(line)
  let l:parser = split(a:line)
  let l:branch = l:parser[0] ==? '*' ? l:parser[1] : l:parser[0]
  execute '!git checkout ' . l:branch
endfunction

command! -bang -nargs=0 FzGCheckout
  \ call fzf#vim#grep(
  \   'git branch -v', 0,
  \   { 'sink': function('s:open_branch_fzf') }, <bang>0)


" ## Indentline

" Doesn't appear on nova colorscheme
if g:colors_name ==? 'nova'
  let g:indentLine_setColors = 0
endif

let g:indentLine_bufTypeExclude = ['terminal']
let g:indentLine_fileTypeExclude = [
    \ 'text', 'help', 'man', 'rst',
    \ 'markdown', 'startify', 'nerdtree'
    \]

" Deactivate on completition, to slow
augroup indentLineAu
  autocmd!
  autocmd InsertEnter * IndentLinesDisable
  autocmd InsertLeave *
        \ if index(g:indentLine_fileTypeExclude, &filetype) < 0
        \   && index(g:indentLine_bufTypeExclude, &buftype) < 0 
        \ | execute 'silent IndentLinesEnable' | 
        \ endif
augroup END


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


" ## Goyo & Limelight

augroup goyoLimelightAu
  autocmd!
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
augroup END


" ## Highlightedyank

let g:highlightedyank_highlight_duration = 250


" ## Sneak

let g:sneak#label = 1  " Show labels
let g:sneak#use_ic_scs = 1  " Case insensitive

" Always show labels
nmap s <Plug>SneakLabel_s
nmap S <Plug>SneakLabel_S


" ## OpenPluginPage

" View plugin page
autocmd! BufNewFile,BufRead *init.vim
       \ nnoremap <buffer> gp :OpenPluginPage<CR>


" ## Fugitive

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <leader>gp :Gpush<CR>


" ## Neoterm

let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'rightbelow'

" Open/close a terminal
nnoremap <silent> <leader>tt :Ttoggle<CR>
" Send current selection to REPL
vnoremap <silent> <leader>tt :TREPLSendSelection<CR>


" ## Vim-test

let g:test#strategy = 'neoterm'


" ## Spotify

nnoremap <C-s>j :Spotify next<CR>
nnoremap <C-s>k :Spotify prev<CR>
nnoremap <C-s>s :Spotify play/pause<CR>
nnoremap <C-s>o :Spotify open<CR>
nnoremap <C-s>c :Spotify status<CR>


" ## Sayonara

nnoremap <silent> <leader>q :Sayonara<CR>


" ## vim-altr

nmap <M-a> <Plug>(altr-forward)


" ## Startify

let g:startify_change_to_vcs_root = 1  " Change cwd to root of git project
let g:startify_files_number = 5  " Show just 5 files on MRU
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks', 'commands']

let g:startify_session_persistence = 1  " Autosave sessions

let g:startify_custom_header = []  " Disable header
