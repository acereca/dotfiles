setlocal foldmethod=marker
setlocal foldlevel=0
let b:strfstr='%Y|%m|%d'

" see autoload/acereca/date.vim
autocmd BufWritePre * call acereca#date#updateLastModified()
