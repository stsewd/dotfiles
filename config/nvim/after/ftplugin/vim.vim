" Open the plugin page of the current line in the browser
fun! s:open_plugin_page()
  if &filetype ==# 'vim'
    let l:pattern = 'Plug\s\+''\([a-zA-Z0-9_.-]\+/[a-zA-Z0-9_.-]\+\)'''
    let l:line = getline('.')
    let l:match = matchlist(l:line, l:pattern)
    if !empty(l:match)
      call netrw#BrowseX('https://github.com/' . l:match[1], 0)
      return
    endif
  endif
  " Default to original gx
  " https://github.com/neovim/neovim/blob/6ca7ebb34685a2be497dd5bb00defd5976af7b27/runtime/plugin/netrwPlugin.vim#L84
  call netrw#BrowseX(expand(get(g:, 'netrw_gx', '<cfile>')), netrw#CheckIfRemote())
endf

nnoremap <silent> gx :call <SID>open_plugin_page()<CR>
