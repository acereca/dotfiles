" VIM Config file
" Patrick Nisble

" prepare Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
Plugin 'Buffergator'

Plugin 'YouCompleteMe'
let g:ycm_global_ycm_extra_conf = ".vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Now we can turn our filetype functionality back on
filetype plugin indent on

" end of plugin stuff

" set behavior i like
syntax on
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
