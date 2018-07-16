if !exists('g:test#python#tox#file_pattern')
  let g:test#python#tox#file_pattern = '\v(test_[^/]+|[^/]+_test)\.py$'
endif

function! test#python#tox#test_file(file) abort
  if fnamemodify(a:file, ':t') =~# g:test#python#tox#file_pattern
    if exists('g:test#python#runner')
      return g:test#python#runner ==# 'tox'
    else
      return executable('tox')
    endif
  endif
endfunction

function! test#python#tox#build_position(type, position) abort
  if a:type ==# 'nearest'
    let l:name = s:nearest_test(a:position)
    if !empty(l:name)
      return [a:position['file'].'::'.l:name]
    else
      return [a:position['file']]
    endif
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

function! test#python#tox#build_args(args) abort
  return a:args
endfunction

function! test#python#tox#executable() abort
  return 'tox'
endfunction

function! s:nearest_test(position) abort
  let l:name = test#base#nearest_test(a:position, g:test#python#patterns)
  let l:path = [get(l:name['namespace'], 0, ''), get(l:name['test'], 0, '')]
  call filter(l:path, '!empty(v:val)')

  return join(l:path, '::')
endfunction
