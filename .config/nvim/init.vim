" VIM Config file
" Patrick Nisble
" Last modified: 2021|05|30

" Sets {{{
    set timeout
    set timeoutlen=200
    set updatetime=300
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

    " Search behaviour
    set ignorecase
    set smartcase
    set incsearch

    set scrolloff=8

    set ttyfast
    set termguicolors

    " turn off swap files {{{
        set noswapfile
        set nobackup
        set nowb
    " }}}
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
    " Plug 'vim-python/python-syntax'
    Plug 'vhda/verilog_systemverilog.vim'

    " Behaviour
    Plug 'farmergreg/vim-lastplace'
    Plug 'thinca/vim-localrc'
    Plug 'tpope/vim-unimpaired'
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'
    Plug 'lervag/vimtex'                            "  ./plugin/vimtex.vim
    " Plug 'neomake/neomake'                          "  ./plugin/neomake.vim
    " " Plug 'vim-syntastic/syntastic'                 "  ./plugin/syntastic.vim
    " Plug 'dense-analysis/ale'                      "  ./plugin/ale.vim
    " " Plug 'puremourning/vimspector'                  "  ./plugin/vimspector.vim

    " Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "  ./plugin/coc.vim

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " visual
    " Plug 'joshdick/onedark.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'bronson/vim-trailing-whitespace'
    " Plug 'rrethy/vim-hexokinase'
    " let g:Hexokinase_highlighters = [ 'background' ]

    " Vim Script
    Plug 'nvim-lua/plenary.nvim'
    " Plug 'folke/todo-comments.nvim'


    " text formatting
    Plug 'psf/black', {'branch': 'stable'}
    Plug 'dhruvasagar/vim-table-mode'
    " Plug 'Yggdroot/indentLine'
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
    " Plug 'tmhedberg/SimpylFold' " ./plugin/simpylfold.vim
    " Plug 'vim-scripts/indentpython.vim'
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

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

let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_sign_priority = 0

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
    let txt = '> ' . nl . 'ℓ: ' . linetext . " "
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
    highlight Folded guifg=#7C869A guibg=NONE
    highlight SignColumn guibg=NONE
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

        " nunmap <C-q>
        nmap <C-q> :q

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


" lua << EOF
  " require("todo-comments").setup {
      " signs = true, -- show icons in the signs column
      " -- keywords recognized as todo comments
      " keywords = {
          " FIX = {
              " icon = " ", -- icon used for the sign, and in search results
              " color = "error", -- can be a hex color, or a named color (see below)
              " alt = { "FIXME", "BUG", "FIXIT", "FIX", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
              " -- signs = false, -- configure signs for some keywords individually
              " },
          " TODO = { icon = " ", color = "info" },
          " HACK = { icon = " ", color = "warning" },
          " WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          " PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          " NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
          " },
      " -- highlighting of the line containing the todo comment
      " -- * before: highlights before the keyword (typically comment characters)
      " -- * keyword: highlights of the keyword
      " -- * after: highlights after the keyword (todo text)
      " highlight = {
          " before = "", -- "fg" or "bg" or empty
          " keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
          " after = "fg", -- "fg" or "bg" or empty
          " pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
          " comments_only = true, -- uses treesitter to match keywords in comments only
          " },
      " -- list of named colors where we try to extract the guifg from the
      " -- list of hilight groups or use the hex color if hl not found as a fallback
      " colors = {
          " error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
          " warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
          " info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
          " hint = { "LspDiagnosticsDefaultHint", "#10B981" },
          " default = { "Identifier", "#7C3AED" },
          " },
      " search = {
          " command = "rg",
          " args = {
              " "--color=never",
              " "--no-heading",
              " "--with-filename",
              " "--line-number",
              " "--column",
              " },
          " -- regex that will be used to match keywords.
          " -- don't replace the (KEYWORDS) placeholder
          " pattern = [[\b(KEYWORDS):]], -- ripgrep regex
          " -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
          " },
      " }
" EOF
