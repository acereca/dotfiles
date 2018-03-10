" VIM Config file
" Patrick Nisble
" Last modified: 2018|03|10

" Plugins {{{
set nocompatible
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    " visual
    Plugin 'AlessandroYorba/Arcadia'
    Plugin 'Yggdroot/indentLine'
    Plugin 'mboughaba/i3config.vim'

    " text formatting
    Plugin 'tpope/vim-surround'
    Plugin 'godlygeek/tabular'
    "Plugin 'Raimondi/delimitMate'

    " NERDTree
    Plugin 'scrooloose/nerdtree'

    "LaTeX
    Plugin 'LaTeX-Box-Team/LaTeX-Box'

    " Python
    Plugin 'tmhedberg/SimpylFold'
    Plugin 'vim-scripts/indentpython.vim'

    " Cmd-t
    Plugin 'wincent/command-t'

    "Loupe
    Plugin 'wincent/loupe'

    "" fallback plugins for non neovim setups
    if !has('nvim')
        Plugin 'Valloric/YouCompleteMe'
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

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" coloring {{{
    let python_highlight_all=1
    syntax on
    colorscheme arcadia
    highlight Normal ctermbg=none
" }}}

" vim-airline {{{
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'minimalist'
    let g:airline#extensions#tabline#enabled = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.maxlinenr = 'ℓ'
" }}}

" loupe {{{
    nmap <leader>/ <Plug>(LoupeClearHighlight)
" }}}

" command-t {{{
    let g:CommandTScanDotDirectories = 1
    let g:CommandTMaxFiles = 500000
    let g:CommandTFileScanner = 'ruby'
" }}}

" custom behaviour {{{
set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set splitbelow
set breakindent
"}}}

" code folding {{{
    set fillchars=vert:┃                                                 " Box Drawings Heavy Vertical (U+2503)
    set fillchars+=fold:·                                                " MIDDLE DOT (U+00B7)
    set foldmethod=syntax
    set foldlevelstart=1
    set foldtext=acereca#folding#foldtext()

    let g:indentLine_char="▏"
    let g:indentLine_color_term = 0
"  }}}
 
" turn off swap files {{{
    set noswapfile
    set nobackup
    set nowb
" }}}

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

    nnoremap <SPACE> <Nop>
    let mapleader = "\<Space>"
 
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
        map <leader>n :NERDTreeToggle<CR>

        map <C-j> :m-2<CR>
        map <C-k> :m+1<CR>
        nnoremap <leader>sc :set spell! spelllang=en,de_de<CR>
    " }}}
" }}}
