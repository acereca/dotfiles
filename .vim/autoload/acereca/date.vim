" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: 2018|03|10
" Restores cursor and window position using save_cursor variable.
function! acereca#date#updateLastModified() abort
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime(b:strfstr) . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
