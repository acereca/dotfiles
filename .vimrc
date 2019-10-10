" VIM Config file
" Patrick Nisble
" Last modified: 2018|12|21

" Plugins {{{
set nocompatible
filetype plugin on
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin("~/.vim/plugged")

    " Syntax
    Plug 'martinda/Jenkinsfile-vim-syntax'
	Plug 'iloginow/vim-stylus'
	Plug 'sirtaj/vim-openscad'
    Plug 'kovetskiy/sxhkd-vim'
    Plug 'sirtaj/vim-openscad'
    Plug 'vim-pandoc/vim-pandoc-syntax'

    " git
    Plug 'tpope/vim-fugitive'

    " visual
    Plug 'joshdick/onedark.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'mboughaba/i3config.vim'
    Plug 'bronson/vim-trailing-whitespace'

    " text formatting
    Plug 'tpope/vim-surround'
    Plug 'godlygeek/tabular'
    Plug 'scrooloose/nerdcommenter'
	Plug 'rhysd/vim-clang-format'

    " NERDTree
    Plug 'scrooloose/nerdtree'

    " Python
    Plug 'tmhedberg/SimpylFold'
    Plug 'vim-scripts/indentpython.vim'
    Plug 'vim-syntastic/syntastic'

    " Vue
    Plug 'posva/vim-vue'
    Plug 'sekel/vim-vue-syntastic'

    " CtrlP
    "Plug 'ctrlpvim/ctrlp.vim'
    
    "fzf
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'

    " Loupe
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
        Plug 'edkolev/tmuxline.vim'
        "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        "Plug 'zchee/deoplete-jedi'
        "    " fuzzy find files in the working directory (where you launched Vim from)Plug 'zchee/deoplete-clang'
		Plug 'Shougo/neoinclude.vim'
        Plug 'jsfaint/coc-neoinclude'
        Plug 'Shougo/neosnippet.vim'
        Plug 'Shougo/neosnippet-snippets'
        Plug 'lervag/vimtex'
        Plug 'neomake/neomake'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
    endif

call plug#end()

filetype plugin indent on
" }}}
"
" pandoc{{{
augroup pandoc_syntax
	au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END
let g:pandoc#syntax#conceal#use = 0
let conceallevel = 3
let g:tex_conceal=""
" }}}

" Syntastic {{{
let g:syntastic_quiet_message = ['12']
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" SimpylFold {{{
let g:SimpylFold_docstring_preview = 1
" }}}

" NEOMAKE {{{
let g:neomake_open_list = 2
let g:neomake_cpp_enabled_makers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++17", "-Wall"]
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
    let g:vimtex_complete_enabled=1

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

    let g:vimtex_view_method = "zathura"

" }}}

" YouCompleteMe {{{
let g:ycm_key_list_previous_completion=['<Up>']
" }}}

" CoC {{{
" Use tab for trigger completion with characters ahead and navigate.
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction<Paste>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<S-tab>"
" }}}

" NeoSnippets.vim {{{
    if has('nvim')
        imap <c-tab>     <Plug>(neosnippet_expand_or_jump)
        smap <C-Tab>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-Tab>     <Plug>(neosnippet_expand_target)
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
    if has('nvim')
        set background=dark
    endif
        colorscheme onedark
    highlight Normal ctermbg=none
    if (empty($TMUX))
        if (has("nvim"))
            "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
            let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
        if (has("termguicolors"))
            set termguicolors
        endif
    endif
" }}}

" keymaps {{{

    nnoremap <SPACE> <Nop>
    let mapleader = "\<Space>"

    " general keymaps {{{

        nnoremap ; :
        vnoremap ; :

        map <leader>n :NERDTreeToggle<CR>
        "nmap <leader>bb :CtrlPBuffer<CR>
        nmap <C-/> :NERDComToggleComment<CR>

        nnoremap <leader>sc :set spell! spelllang=en_us,de_de<CR>
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

        "fzf
        nmap <leader>f :Files<cr>
        nmap <leader>/ :BLines<cr>
        nmap <leader>b :Buffers<cr>
        nmap <leader>r :Rg

    " }}}
" }}}
