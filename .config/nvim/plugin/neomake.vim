" NEOMAKE
call neomake#configure#automake('w')
let g:neomake_open_list = 2

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': [],
    \ 'errorformat': '%f:%l:%c %m',
\ }
let g:neomake_cpp_enabled_makers=['make']
let g:neomake_cpp_clang_args = ["-std=c++17", "-Wall"]
let g:neomake_python_flake8_maker = {
        \ 'args':['--ignore=E501']
    \}
"let g:neomake_tex_make_maker = {
    "\ 'exe': 'make',
    "\ 'args': [],
    "\ 'errorformat': '%f:%l:%c %m',
    "\ }
let g:neomake_tex_enabled_makers=[]
