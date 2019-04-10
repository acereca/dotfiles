" VIM Config file
" Patrick Nisble
" Last modified: 2018|12|21

" Plugins {{{
set nocompatible
filetype plugin on
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin("~/.vim/plugged")

    Plug 'martinda/Jenkinsfile-vim-syntax'

    " git
    Plug 'tpope/vim-fugitive'

    " visual
    " Plug 'AlessandroYorba/Sierra'
    " Plugin 'altercation/vim-colors-solarized' 
    Plug 'joshdick/onedark.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'mboughaba/i3config.vim'

    " text formatting
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    "Plugin 'Raimondi/delimitMate'
    Plug 'scrooloose/nerdcommenter'

    " NERDTree
    Plug 'scrooloose/nerdtree'

    " Python
    Plug 'tmhedberg/SimpylFold'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'vim-syntastic/syntastic'

    " Cmd-t
    "Plugin 'wincent/command-t'
    "Plugin 'kien/ctrlp.vim'
    Plug 'ctrlpvim/ctrlp.vim'

    "Loupe
    Plug 'wincent/loupe'

    " unimPaired
    Plug 'tpope/vim-unimpaired'

    " HTML Tags
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'

    "" fallback plugins for non neovim setups
    if !has('nvim')
        Plug 'Valloric/YouCompleteMe'
        Plug 'SirVer/UltiSnips'
        Plug 'honza/vim-snippets'

        "LaTeX
        Plug 'LaTeX-Box-Team/LaTeX-Box'
    endif

    "" NeoVim specific
    if has('nvim')
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-jedi'
        Plug 'zchee/deoplete-clang'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'lervag/vimtex'
        Plug 'neomake/neomake'
    endif

call plug#end()

filetype plugin indent on
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" SimpylFold {{{
let g:SimpylFold_docstring_preview = 1
" }}}

" NEOMAKE {{{
let g:neomake_open_list = 2
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

" command-t / ctrl-p {{{
    let g:CommandTScanDotDirectories = 1
    let g:CommandTGitIncludeUntracked = 0
    let g:CommandTGitScanSubmodules = 1
    let g:CommandTMaxFiles = 1000000
    let g:CommandTFileScanner = 'git'

    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
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

" vimtex {{{
    let g:vimtex_fold_enabled=0
    let g:vimtex_complete_close_braces=1

    let g:vimtex_compiler_progname = "nvr"
    let g:vimtex_compiler_latexmk = {
              \ 'backend' : 'nvim', 
              \ 'background' : 1,
              \ 'build_dir' : '',
              \ 'callback' : 1,
              \ 'continuous' : 1,
              \ 'executable' : 'latexmk',
              \ 'options' : [
              \   '-xelatex',
              \   '-pdf',
              \   '-bibtex',
              \   '-verbose',
              \   '-file-line-error',
              \   '-synctex=1',
              \   '-interaction=batchmode',
              \   '-shell-escape',
              \ ]
              \}

" }}}

" YouCompleteMe {{{
let g:ycm_key_list_previous_completion=['<Up>']
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<s-tab>"
" }}}

" NeoSnippets.vim {{{
    if has('nvim')
        imap <c-tab>     <Plug>(neosnippet_expand_or_jump)
        smap <C-Tab>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-Tab>     <Plug>(neosnippet_expand_target)

        imap <expr><Tab> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
    endif
    let g:neosnippet#snippets_directory="~/.vim/snippets"
" }}}

" Powerline {{{
    if !has('nvim')
        let g:powerline_pycmd = "py3"
        set rtp+=/usr/lib/python*/site-packages/powerline/bindings/vim
        "let g:powerline_left_sep = "\uE0b4"
        set laststatus=2
    endif
" }}}

" custom behaviour {{{

set hidden " buffer hidden if modified
set number norelativenumber

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set splitbelow
set breakindent
" save pos on buffer switch
if v:version >= 700
  au BufLeave * let b:winview = winsaveview()
  au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
endif
"}}}

" aliasing {{{
cnoreabbrev W w
cnoreabbrev Q q
"}}}

" global std for stfrtime string {{{
let g:strfstr = '%Y|%m|%d'
" run everytime needs to set b:updateModified Date in ftplugin
"autocmd BufWritePre * call acereca#date#updateLastModified()
" }}}

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

" coloring {{{
    let python_highlight_all=1
    let g:onedark_terminal_italics=1
    syntax on
    if has('nvim')
        set background=dark
    endif
        colorscheme onedark
    highlight Normal ctermbg=none
" }}}

" keymaps {{{

    nnoremap <SPACE> <Nop>
    let mapleader = "\<Space>"

    " general keymaps {{{
        
        "nnoremap <C-Tab> gt
        "nnoremap <S-Tab> gT
        
        nnoremap ; :
        vnoremap ; :
        
        "imap <C-Space> <C-P>

        map <leader>n :NERDTreeToggle<CR>
        nmap <leader>bb :CtrlPBuffer<CR>
        nmap <C-/> :NERDComToggleComment<CR>

        nnoremap <leader>sc :set spell! spelllang=en,de_de<CR>
        nnoremap <C-j> :m+<CR>
        nnoremap <C-k> :m-2<CR>
        vnoremap <C-j> :m '>+1<CR>gv=gv
        vnoremap <C-k> :m '<-2<CR>gv=gv

        " change to buffer
        nmap <leader>l :bnext<CR>
        nmap <leader>h :bprevious<CR>
        nmap <leader>bq :bp <BAR> bd #<CR>

        " remove arrow bindings
        map <up> <nop>
        map <down> <nop>
        map <left> <nop>
        map <right> <nop>
        imap <up> <nop>
        imap <down> <nop>
        imap <left> <nop>
        imap <right> <nop>

        " add minimal movement in insert mode
        inoremap <c-h> <left>
        inoremap <c-j> <down>
        inoremap <c-k> <up>
        inoremap <c-l> <right>

        imap <c-s> <nop>
        imap <c-u> <nop>
        noremap <c-s> :update<CR>
        inoremap <c-S> <c-o>:update<CR>
        inoremap <c-s> <esc>:update<CR>
        vnoremap <c-s> <c-c>:update<CR>
    " }}}
" }}}
