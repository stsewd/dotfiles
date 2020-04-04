if !exists('g:test#python#nox#file_pattern')
  let g:test#python#nox#file_pattern = '\v(test_[^/]+|[^/]+_test)\.py$'
endif

function! test#python#nox#test_file(file) abort
  if fnamemodify(a:file, ':t') =~# g:test#python#nox#file_pattern
    if exists('g:test#python#runner')
      return g:test#python#runner ==# 'nox'
    else
      return filereadable('noxfile.py') && executable('nox')
    endif
  endif
endfunction

function! test#python#nox#build_position(type, position) abort
  let l:file = fnamemodify(a:position['file'], ':p')
  if a:type ==# 'nearest'
    let l:name = s:nearest_test(a:position)
    if !empty(l:name)
      return [l:file.'::'.l:name]
    else
      return [l:file]
    endif
  elseif a:type ==# 'file'
      return [l:file]
  else
    return []
  endif
endfunction

function! test#python#nox#build_args(args) abort
  return a:args
endfunction

function! test#python#nox#executable() abort
  return 'nox'
endfunction

function! s:nearest_test(position) abort
  let l:name = test#base#nearest_test(a:position, g:test#python#patterns)
  let l:path = [get(l:name['namespace'], 0, ''), get(l:name['test'], 0, '')]
  call filter(l:path, '!empty(v:val)')

  return join(l:path, '::')
endfunction
