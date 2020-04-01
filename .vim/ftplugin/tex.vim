function! Ubib_select()
    let l:hl = expand("<cword>")
    execute "!python ~/github/scripts/select.ubib.py " . hl
endfunction


if !has('nvim')
    nnoremap <leader>mk :update <CR> :VimtexCompile <CR>
    nnoremap <leader>cc :update <CR> :VimtexClean <CR>
    nnoremap <F5> :!evince %:r.pdf &<CR><CR>
endif
if has('nvim')
    nmap <leader>mk <Plug>(vimtex-compile)
    nmap <leader>cc <Plug>(vimtex-clean)
    nmap <F5> <Plug>(vimtex-view)
    nmap <leader>bib :e ~/github/ubib/ubib.bib <CR>
    nmap <leader>v :call Ubib_select()<CR>
endif

inoremap <C-y> <C-k>

setlocal cole=0
"au InsertLeave *.tex %s/\\\"a/ä/ge
"au InsertLeave *.tex %s/\\\"o/ö/ge
"au InsertLeave *.tex %s/\\\"u/ü/ge

setlocal foldlevel=0
