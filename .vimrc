" Automatic Vim-Plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif

" Plugins
call plug#begin()
    Plug 'tpope/vim-fugitive'
    Plug 'chriskempson/base16-vim'
    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'wakatime/vim-wakatime'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'leafgarland/typescript-vim'
    Plug 'keith/swift.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'yggdroot/indentline'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'w0rp/ale'
    Plug 'rust-lang/rust.vim'
    Plug 'cespare/vim-toml'
    Plug 'elzr/vim-json'
    Plug 'pprovost/vim-ps1'
    Plug 'oranget/vim-csharp'
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
call plug#end()

" Styles
let t_Co=256
let base16colorspace=256
let airline_theme="base16_ocean"
let g:airline_powerline_fonts = 1
let g:airline_section_y = '%{ALEGetStatusLine()}'
colorscheme base16-ocean

" Lint
let g:ale_linters = {'typescript': []} " Doesn't work with .tsx well
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'Error'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Custom Keybindings
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <F6> :set noet|retab!
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Settings
let g:ycm_src_path = '/home/sowderca/Tools/rustc-1.10.0/src'
let g:used_javascript_libs = 'underscore, react, jquery'
let g:vim_json_syntax_conceal = 0
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1 " Enable true color for neovim


" FileType Options
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufRead,BufNewFile *.rs set ft=rust
" Options
set termguicolors
set fileformats=unix,dos,mac
set completeopt-=preview
set hlsearch
set magic
" set lazyredraw
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cindent
set list
set listchars=tab:→\  
set showcmd
set ignorecase
set smartcase
set incsearch
set autowrite
set noshowmode
set hidden
set synmaxcol=1000
set mouse=a
set number
set wildmenu
set laststatus=2
set titlestring=VIM
set background=dark
set noerrorbells
set novisualbell

if has("autocmd")
    filetype plugin indent on
endif

if has("syntax")
    syntax on
endif

if has('win32')
    let g:vim_home_path = '~/vimfiles'
elseif has('nvim')
    set clipboard+=unnamedplus
    let g:vim_home_path = '~/.vim'
else
    let g:vim_home_path = '~/.vim'
endif

" GUI Settings
if has("gui_running")
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
  if has("gui_gtk2")
    set guifont=Hack\ 11
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight Comment gui=italic
