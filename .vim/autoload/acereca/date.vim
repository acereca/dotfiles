" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" Restores cursor and window position using save_cursor variable.
" last modified: 2018|03|10
function! acereca#date#updateLastModified() abort
    if exists("b:updateModifiedDate")
        if &modified
            let save_cursor = getpos(".")
            let n = min([20, line("$")])
            keepjumps exe '1,' . n . 's/\v^(.{,10}[Ll]ast [Mm]odified: ).*/\1' .
                        \ strftime(b:strfstr) . '/e'
            call histdel('search', -1)
            call setpos('.', save_cursor)
        endif
    endif
endfun
