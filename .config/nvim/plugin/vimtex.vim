" vimtex
let g:vimtex_fold_enabled=0
let g:vimtex_syntax_enabled=1
let g:vimtex_syntax_conceal_default=0
let g:vimtex_complete_close_braces=1
let g:vimtex_complete_enabled=1

let g:vimtex_compiler_progname = "nvim"
"let g:vimtex_compiler_method = "latexrun"
let g:vimtex_compiler_latexrun = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'options' : [
            \   '--latex-args="-synctex=1 -shell-escape"',
            \   '--latex-cmd=xelatex',
            \ ],
            \}
let g:vimtex_compiler_latexmk = {
            \ 'backend' : 'nvim',
            \ 'background' : 1,
            \ 'build_dir' : '',
            \ 'callback' : 1,
            \ 'continuous' : 1,
            \ 'executable' : 'latexmk',
            \ 'options' : [
            \   '-bibtex',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=batchmode',
            \   '-shell-escape',
            \   '-xelatex',
            \ ]
            \}

let g:vimtex_view_method = 'zathura'
