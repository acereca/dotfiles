setlocal shiftwidth=4
setlocal tabstop=4
"@set softtabstop=0 noexpandtab
setlocal foldmethod=syntax

set listchars+=eol:\ 
highlight NonText term=NONE ctermfg=239 gui=NONE
set list

nnoremap <leader>mk :w <CR> :make <CR>

autocmd BufWritePre *.* :%s/\s\+$//e

let g:syntastic_cpp_include_dirs = ['../same70/include/**', '../CMSIS/Include/**', 'src/Device_Startup', 'src/Common', 'include', 'src']

