" VIM Config file
" Patrick Nisble
" last modified: Dec 2017

" Plugins {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/Vundle.vim'

" Github Plugins {{{
Plugin 'tpope/vim-surround'

Plugin 'Raimondi/delimitMate'
"Plugin 'flazz/vim-colorschemes'
Plugin 'AlessandroYorba/Arcadia'

"LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'

Plugin 'Valloric/YouCompleteMe'
" }}}

call vundle#end()
filetype plugin indent on
" }}}

" coloring {{{
let python_highlight_all=1
syntax on
colorscheme arcadia 
" }}} 

" set behavior i like
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set breakindent

" code folding {{{
"set foldmethod=indent
"set foldlevel=99
set foldmethod=marker
set foldlevel=0
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
" }}}

" turn off swap files
set noswapfile
set nobackup
set nowb

" Latex-Box {{{
let g:LatexBox_latexmk_options="-synctex=1 -interaction=nonstopmode -file-line-error -xelatex -shell-escape"
let g:LatexBox_Folding=1
let g:LatexBox_fold_sections = [
                        \ "subsection",
                        \ "subsubsection"
                        \ ]
" }}}

" Powerline {{{
set rtp+=/usr/lib/python*/site-packages/powerline/bindings/vim
"let g:powerline_left_sep = "\uE0b4"
set laststatus=2
" }}}

" keymaps {{{
" general keymaps {{{
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-h> <C-W><C-H>
nnoremap <C-l> <C-W><C-L>
imap <C-Space> <C-P>
" }}}
" filtype dependent keymaps {{{
autocmd FileType python nnoremap <buffer> <F5> :w !python > /tmp/%:t.out <Enter><Enter>
autocmd FileType tex    nnoremap <buffer> <F5> :w <Enter> :Latexmk <Enter>
" }}}
" }}}
