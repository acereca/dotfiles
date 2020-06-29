if !has('nvim')
    nnoremap <leader>mk :update <CR> :VimtexCompile <CR>
    nnoremap <leader>cc :update <CR> :VimtexClean <CR>
    nnoremap <F5> :!evince %:r.pdf &<CR><CR>
endif
if has('nvim')
    nmap <leader>mk <Plug>(vimtex-compile)
    nmap <leader>cc <Plug>(vimtex-clean)
    nmap <F5> <Plug>(vimtex-view)
    nmap <leader>u :e ~/github/ubib/ubib.bib <CR>
    nmap <leader>v :call Ubib_select()<CR>
endif

inoremap <C-y> <C-k>

setlocal cole=0

setlocal foldlevel=0
