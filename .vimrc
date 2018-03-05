" VIM Config file
" Patrick Nisble
" last modified: Feb 2018

" Plugins {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'

Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
"Plugin 'flazz/vim-colorschemes'
Plugin 'AlessandroYorba/Arcadia'
Plugin 'mboughaba/i3config.vim'

"LaTeX
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Python
"Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'vim-syntastic/syntastic'

"" Completion
Plugin 'Valloric/YouCompleteMe'

"" not NeoVim usage
if !has('nvim')
    Plugin 'SirVer/UltiSnips'
    Plugin 'honza/vim-snippets'
endif

"" NeoVim specific
if has('nvim')
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'Shougo/deoplete.nvim'
    Plugin 'zchee/deoplete-jedi'
    Plugin 'zchee/deoplete-clang'
    Plugin 'Shougo/neosnippet.vim'
    Plugin 'Shougo/neosnippet-snippets'
endif

call vundle#end()
filetype plugin indent on
" }}}

let g:deoplete#enable_at_startup = 1

" coloring {{{
let python_highlight_all=1
syntax on
colorscheme arcadia
highlight Normal ctermbg=none
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
" }}}

" set behavior i like
set nu
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
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

" turn off swap files, because the suck!!!!!
set noswapfile
set nobackup
set nowb

" NERDTree {{{
let NERDTreeWinSize=20
"}}}

 " Latex-Box {{{
let g:tex_flavor="latex"
let g:LatexBox_latexmk_options="-interaction=nonstopmode -file-line-error -xelatex -shell-escape"
let g:LatexBox_Folding=1
let g:LatexBox_fold_sections = [
                        \ "section",
                        \ "subsection",
                        \ "subsubsection"
                        \ ]
let g:LatexBox_quickfix=4
if has('nvim')
    let g:LatexBox_latexmk_async=1
endif
" }}}

" YouCompleteMe {{{
let g:ycm_key_list_previous_completion=['<Up>']
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<s-tab>"
" }}}

" NeoSnippets.vim {{{
if has('nvim')
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)
endif
" }}}

" Powerline {{{
if !has('nvim')
    let g:powerline_pycmd = "py3"
    set rtp+=/usr/lib/python*/site-packages/powerline/bindings/vim
    "let g:powerline_left_sep = "\uE0b4"
    set laststatus=2
endif
" }}}

" keymaps {{{
" general keymaps {{{
nnoremap <C-S-J> <C-W><C-J>
nnoremap <C-S-Up> <C-W><Up>

nnoremap <C-S-K> <C-W><C-K>
nnoremap <C-S-Down> <C-W><Down>

nnoremap <C-S-H> <C-W><C-H>
nnoremap <C-S-Left> <C-W><Left>

nnoremap <C-S-L> <C-W><C-L>
nnoremap <C-S-Right> <C-W><Right>

imap <C-Space> <C-P>
map <C-n> :NERDTreeToggle<CR>

map <C-j> :m-2<CR>
map <C-k> :m+1<CR>
nnoremap <leader>sc :set spell! spelllang=en,de_de<CR>

" }}}
 " filtype dependent keymaps {{{
autocmd FileType python nnoremap <buffer> <F5> :w <CR> :!python % <CR>
autocmd FileType tex    nnoremap <buffer> <F5> :w <CR> :Latexmk <CR>
autocmd FileType tex    nnoremap <buffer> cc :w <CR> :LatexmkClean <CR>
autocmd FileType html   nnoremap <buffer> <F5> :w <CR> :!chromium % <CR><CR>
autocmd Filetype rmd    nnoremap <buffer> <F5> :w <CR> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla <CR>
" }}}
" }}}
