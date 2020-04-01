echom "HI"

let g:screenshooter = "xfce4-screenshooter"
function! LNScreengrab()
    let s:time=system("date +%Y-%m-%d-%H%M%S")[:-2]
    let s:subdir=expand('%:p:h')
    call system(g:screenshooter . " -r -s " . s:subdir . "/img/" . s:time . ".png")
    if filereadable(s:subdir . "/img/" . s:time .".png")
        let fail=append( line('.') , "![](./img/" . s:time . ".png)")
        let nline=line('.') + 1
        call cursor( nline, 2)
    endif
endfunction

function! LNDataGen()
    let s:subdir=expand('%:p:h')
    echom s:subdir
    if filereadable(s:subdir . "../../template.mk")
        call system("make -C " . s:subdir . " -f ../../template.mk _data.json")
    endif
endfunction

imap <C-Space> <C-o>:call LNScreengrab()<CR>
imap <c-s> <esc>:update<cr>:call LNDataGen()<cr>

let conceallevel = 0
