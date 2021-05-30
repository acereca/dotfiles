" VIM Config file
" Patrick Nisble
" Last modified: 2020|09|15

" Sets {{{
set updatetime=300
set timeout
set timeoutlen=200
set nobackup
set nowritebackup

""" don't give |ins-completion-menu| messages.
set shortmess+=c

""" always show signcolumns
set signcolumn=yes

set nocompatible
set conceallevel=0

set hidden " buffer hidden if modified
set number relativenumber

set clipboard+=unnamedplus
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
set expandtab
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set splitbelow
set breakindent
" }}}

" Plugins {{{
filetype plugin on
call plug#begin("~/.config/nvim/plugged")

    " Syntax
    Plug 'martinda/Jenkinsfile-vim-syntax'
	Plug 'iloginow/vim-stylus'
	Plug 'sirtaj/vim-openscad'
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'vim-scripts/svg.vim'
    Plug 'hura/vim-asymptote'
    Plug 'nikvdp/ejs-syntax'
    Plug 'ledger/vim-ledger'
    Plug 'nathangrigg/vim-beancount'
    Plug 'mboughaba/i3config.vim'
    Plug 'Glench/Vim-Jinja2-Syntax'
    Plug 'posva/vim-vue'
    Plug 'vim-python/python-syntax'
    Plug 'vhda/verilog_systemverilog.vim'

    " Behaviour
    Plug 'farmergreg/vim-lastplace'
    Plug 'thinca/vim-localrc'
    Plug 'tpope/vim-unimpaired'
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'
    Plug 'lervag/vimtex'                            "  ./plugin/vimtex.vim
    Plug 'neomake/neomake'                          "  ./plugin/neomake.vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "  ./plugin/coc.vim
    "Plug 'vim-syntastic/syntastic'                 "  ./plugin/syntastic.vim
    "Plug 'dense-analysis/ale'                      "  ./plugin/ale.vim
    Plug 'puremourning/vimspector'                  "  ./plugin/vimspector.vim

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " visual
    Plug 'joshdick/onedark.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'rrethy/vim-hexokinase'

    " text formatting
    Plug 'psf/black', {'branch': 'stable'}
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    Plug 'preservim/nerdcommenter' " ./plugin/nerdcommenter.vim
	Plug 'rhysd/vim-clang-format'

    " Navigation
    Plug 'scrooloose/nerdtree' " ./plugin/nerdtree.vim
    Plug 'Yilin-Yang/vim-markbar' " ./plugin/markbar.vim
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " Python
    Plug 'tmhedberg/SimpylFold' " ./plugin/simpylfold.vim
    Plug 'vim-scripts/indentpython.vim'

    " Previews
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  } " ./plugin/markdown-preview.nvim.vim

    " Completion
    Plug 'SirVer/UltiSnips' " ./plugin/ultisnips.vim

    " NeoVim specific
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
    Plug 'Shougo/neoinclude.vim'

call plug#end()

if $SOCK != ""
    call serverstart($SOCK)
endif

filetype plugin indent on
" }}}

" pandoc{{{
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

function! s:pandocappend()
    noautocmd set filetype+=.pandoc
endfunction

let g:pandoc#syntax#conceal#use = 0
let g:tex_conceal=""
" }}}


" aliasing {{{
"cnoreabbrev W w
"cnoreabbrev Q q
"}}}

" global std for stfrtime string {{{
let g:strfstr = '%Y|%m|%d'
" run everytime needs to set b:updateModified Date in ftplugin
"autocmd BufWritePre * call acereca#date#updateLastModified()
" }}}

" code folding {{{
function! Foldtext_generator()
    let nl = v:foldend - v:foldstart + 1
    let comment = substitute(getline(v:foldstart+1),"^ *","",1)
    let linetext = substitute(getline(v:foldstart),"^ *","",1)
    let txt = '+ ' . nl . 'ℓ: ' . linetext
    return txt
endfunction

set fillchars=vert:┃                                                 " Box Drawings Heavy Vertical (U+2503)
set fillchars+=fold:·                                                " MIDDLE DOT (U+00B7)
set foldmethod=marker
set foldnestmax=1
set foldtext=Foldtext_generator()

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
    set background=dark
    colorscheme nord
    highlight Normal ctermbg=NONE guibg=NONE
    if (empty($TMUX))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        if (has("termguicolors"))
            set termguicolors
        endif
    endif
    highlight Folded guifg=#7C869A
" }}}

" keymaps {{{

    nnoremap <SPACE> <Nop>
    let mapleader = "\<Space>"

    " general keymaps {{{
        nnoremap <leader><leader> za

        nnoremap ; :
        vnoremap ; :

        nnoremap <leader>sc :set spell! spelllang=en_us,de_de<CR>
        nnoremap <C-j> :m+<CR>
        nnoremap <C-k> :m-2<CR>
        vnoremap <C-j> :m '>+1<CR>gv=gv
        vnoremap <C-k> :m '<-2<CR>gv=gv

        " change to buffer
        nmap <leader>l :bnext<CR>
        nmap <leader>h :bprevious<CR>

        nmap <leader>o :wincmd f<CR>

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

        nmap <m-l> :bnext<CR>
        nmap <m-h> :bprevious<CR>
        nmap <m-j> :tabNext<CR>
        nmap <m-k> :tabprevious<CR>
        "nmap <c-l> <c-w>l
        "nmap <c-h> <c-w>h

        imap <c-s> <nop>
        imap <c-u> <nop>
        noremap <c-s> :update<CR>
        inoremap <c-S> <c-o>:update<CR>
        imap <c-s> <esc>:update<CR>
        vnoremap <c-s> <c-c>:update<CR>


        " Temrinal Mode
        tnoremap <esc> <c-\><c-n>

    " }}}
" }}}

" LUA TESTING {{{
lua require("personal")
" }}}
