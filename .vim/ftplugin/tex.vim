nnoremap <leader>mk :w <CR> :Latexmk <CR>
nnoremap <leader>cc :w <CR> :LatexmkClean <CR>
nnoremap <F5> :!evince %:r.pdf &<CR><CR>

setlocal cole=2
let g:tex_conceal=''
