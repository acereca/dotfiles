echom "HI"


let g:screenshooter = "xfce4-screenshooter"
function! LNScreengrab()
    let s:time=system("date +%Y-%m-%d-%H%M%S")[:-2]
    let s:subdir=expand('%:p:h')
    call system(g:screenshooter . " -r -s " . s:subdir . "/img/" . s:time . ".png")
    if filereadable(s:subdir . "/img/" . s:time .".png")
        let fail=append( line('.') , "![](img/" . s:time . ".png)")
        let nline=line('.') + 1
        call cursor( nline, 2)
    endif
endfunction

imap <C-Space> <C-o>:call LNScreengrab()<CR>

let conceallevel = 0
