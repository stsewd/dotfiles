" ..........................................................
" # Settings
" ..........................................................
set t_vb=  " Prevent Vim from blinking

set guioptions-=T  " Disable the toolbar
set guioptions-=m  " Disable the menubar
set guioptions-=r  " Remove right-hand scroll bar
set guioptions-=L  " Remove left-hand scroll bar
set guioptions-=e  " Do not show tabline

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set antialias

let g:netrw_browsex_viewer="setsid xdg-open"  " Fix gx in gvim


" ..........................................................
" # Key-Bindings
" ..........................................................

" Press enter/shift+enter for inserting a new line on normal mode
nmap <S-Enter> O<Esc>
nmap <C-Enter> o<Esc>

" Move lines with Alt+{jk}
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

