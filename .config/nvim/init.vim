" VIM Config file
" Patrick Nisble
" Last modified: 2020|09|15

" Plugins {{{
set nocompatible
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
    Plug 'rrethy/vim-hexokinase'
    let g:Hexokinase_highlighters = ['virtual']


    " local vimrcs
    Plug 'thinca/vim-localrc'

    " git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " visual
    Plug 'joshdick/onedark.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'bronson/vim-trailing-whitespace'

    " text formatting
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'Yggdroot/indentLine'
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    Plug 'preservim/nerdcommenter'
	Plug 'rhysd/vim-clang-format'

    " NERDTree
    Plug 'scrooloose/nerdtree'

    " Python
    Plug 'tmhedberg/SimpylFold'
    Plug 'vim-scripts/indentpython.vim'
    "Plug 'vim-syntastic/syntastic'

    " Vue
    Plug 'posva/vim-vue'
    "Plug 'sekel/vim-vue-syntastic'

    " CtrlP
    "Plug 'ctrlpvim/ctrlp.vim'

    " ALE
    "Plug 'dense-analysis/ale'

    "fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

    " Loupe
    "Plug 'wincent/loupe'
    "
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

    " unimPaired
    "Plug 'tpope/vim-unimpaired'

    " HTML Tags
    Plug 'alvan/vim-closetag'
    Plug 'mattn/emmet-vim'

    "System-Verilog
    " Plug 'nachumk/systemverilog.vim'
    Plug 'vhda/verilog_systemverilog.vim'

    " Completion
    Plug 'SirVer/UltiSnips' | Plug 'honza/vim-snippets'


    "" NeoVim specific
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'edkolev/tmuxline.vim'
    Plug 'Shougo/neoinclude.vim'
    Plug 'lervag/vimtex'
    "Plug 'brennier/quicktex'
    Plug 'neomake/neomake'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

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
let conceallevel = 3
let g:tex_conceal=""
" }}}

" Syntastic {{{
let g:syntastic_quiet_message = ['12']
let g:syntastic_error_symbol = ""
let g:syntastic_warning_symbol = ""
let g:syntastic_style_error_symbol = ""
let g:syntastic_style_warning_symbol = ""
let g:syntastic_tex_checkers = ["chktex", "text/language_check"]
let g:syntastic_flake8_args = ['--ignore=E501']
let g:Syntastic_python_checkers = ["flake8"]
" }}}

" ALE {{{
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_cpp_clang_options="-std=c++2a -fmodules-ts -I../lib"
let g:ale_cpp_clangcheck_options="-std=c++2a -fmodules-ts -I../lib"
let g:ale_linters = {
    \'python': ['flake8', 'pylint'],
    \'tex': ['chktex', 'lacheck'],
    \}
let g:ale_fixers = {
    \'python': ['yapf'],
    \'tex': ['latexindent'],
    \}
nmap <F10> :ALEFix<CR>
" }}}

" CoC {{{
  "\ 'coc-pairs',
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-json',
  \ 'coc-angular',
  \ 'coc-markdownlint',
  \ 'coc-snippets'
  \ ]
  "\ 'coc-pyright',

" From Coc Readme
set updatetime=300

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use D to show documentation in preview window
nnoremap <silent> D :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
"nmap <rn> <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  "autocmd!
  " Setup formatexpr specified filetype(s).
  "@autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
"xmap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap if <Plug>(coc-funcobj-i)
"omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"}}}

" SimpylFold {{{
let g:SimpylFold_docstring_preview = 1
" }}}

" NEOMAKE {{{
call neomake#configure#automake('w')
let g:neomake_open_list = 0
let g:neomake_cpp_enabled_makers=['make']
let g:neomake_cpp_clang_args = ["-std=c++17", "-Wall"]
let g:neomake_python_flake8_maker = {
        \ 'args':['--ignore=E501']
    \}
let g:neomake_tex_make_maker = {
    \ 'exe': 'make',
    \ 'args': [],
    \ }
let g:neomake_tex_enabled_makers=['make']

" }}}

" vim-airline {{{
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'nord'
    let g:airline#extensions#tabline#enabled = 1

    let g:airline#extensions#tmuxline#enabled = 1
    let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
    let g:airline_symbols.maxlinenr = 'ℓ'
" }}}

" loupe {{{
    nmap <leader>/ <Plug>(LoupeClearHighlight)
" }}}

" command-t / ctrl-p / fzf {{{
    let g:CommandTScanDotDirectories = 1
    let g:CommandTGitIncludeUntracked = 0
    let g:CommandTGitScanSubmodules = 1
    let g:CommandTMaxFiles = 1000000
    let g:CommandTFileScanner = 'git'

    "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
    "
    "call fzf#run({'sink': 'e'})
" }}}

" NERDCommenter {{{
    "let NERDCreateDefaultMappings=0
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
    let g:vimtex_syntax_enabled=1
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
" }}}

" YouCompleteMe {{{
let g:ycm_key_list_previous_completion=['<Up>']
" }}}

" UltiSnips {{{
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<tab>"
    let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
" }}}

" NeoSnippets.vim {{{
    imap <C-CR>     <Plug>(neosnippet_expand_or_jump)
    smap <C-CR>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-CR>     <Plug>(neosnippet_expand_target)
" }}}

" custom behaviour {{{

set hidden " buffer hidden if modified
set number norelativenumber

set clipboard+=unnamedplus
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab
set expandtab
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
    set background=dark
    colorscheme nord
    highlight Normal ctermbg=NONE guibg=NONE
    if (empty($TMUX))
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        if (has("termguicolors"))
            set termguicolors
        endif
    endif
" }}}

" keymaps {{{

    nnoremap <SPACE> <Nop>
    let mapleader = "\<Space>"

    " general keymaps {{{
        nnoremap <leader><leader> za

        nnoremap ; :
        vnoremap ; :

        map <leader>n :NERDTreeToggle<CR>
        "nmap <leader>bb :CtrlPBuffer<CR>
        "nnoremap <C-/> :NERDComToggleComment<CR>
        nmap  <plug>NERDCommenterToggle
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

        " Refactor
        nmap <leader><F2> <Plug>(coc-rename)

        "fzf
        nmap <leader>f :Files<cr>
        nmap <leader>/ :BLines<cr>
        nmap <leader>b :Buffers<cr>
        nmap <leader>r :Rg 

        set timeout
        set timeoutlen=100

        " Temrinal Mode
        tnoremap <esc> <c-\><c-n>
    " }}}
" }}}

" LUA TESTING {{{
lua require("personal")
" }}}
