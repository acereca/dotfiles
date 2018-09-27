nnoremap <F5> :w <CR> :!python % <CR>
nnoremap <F17> :w <CR> :!python % 
nnoremap <leader>mk :w <CR> :!python % <CR>

setlocal foldmethod=indent

let b:updateModifiedDate=1
let b:strfstr=g:strfstr

call neomake#configure#automake('nw', 1000)
let g:neomake_python_enabled_makers = ['flake8', 'python']
