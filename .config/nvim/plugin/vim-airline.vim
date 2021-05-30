" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = 'ℓ'
