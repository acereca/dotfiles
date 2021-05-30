" ALE
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_cpp_clang_options="-std=c++2a -fmodules-ts -I../lib"
let g:ale_cpp_clangcheck_options="-std=c++2a -fmodules-ts -I../lib"
let g:ale_linters = {
    \'python': ['flake8', 'pylint'],
    \'tex': ['chktex --nowarn 3', 'lacheck'],
    \}
let g:ale_fixers = {
    \'python': ['yapf'],
    \'tex': ['latexindent'],
    \}
nmap <F10> :ALEFix<CR>
