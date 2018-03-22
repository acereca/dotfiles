if !has('nvim')
    nnoremap <leader>mk :w <CR> :Latexmk <CR>
    nnoremap <leader>cc :w <CR> :LatexmkClean <CR>
    nnoremap <F5> :!evince %:r.pdf &<CR><CR>
endif

if has('nvim')
    nmap <leader>mk <Plug>(vimtex-compile)
endif

inoremap <C-y> <C-k>

setlocal cole=2
let g:tex_conceal=''
"au InsertLeave *.tex %s/\\\"a/ä/ge
"au InsertLeave *.tex %s/\\\"o/ö/ge
"au InsertLeave *.tex %s/\\\"u/ü/ge

setlocal foldlevel=0
