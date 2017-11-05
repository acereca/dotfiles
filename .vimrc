" VIM Config file
" Patrick Nisble

" prepare Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'flazz/vim-colorschemes'
Plugin 'davidhalter/jedi-vim'

" end of PLugin setups
call vundle#end()
filetype plugin indent on

" coloring
syntax on
colorscheme flattr

" set behavior i like
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" turn off swap files
set noswapfile
set nobackup
set nowb

" add convenient shortcuts
map <silent> <c-f> :NERDTreeToggle<CR>
nmap <c-r> :!g++ % -o temp.out -lpython2.7 && ./temp.out && rm temp.out<CR>

" enable Powerline
set rtp+=/usr/lib/python*/site-packages/powerline/bindings/vim
set laststatus=2
