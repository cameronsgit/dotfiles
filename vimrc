" Automatic Vim-Plug installation unless on Windows
if !has('win32')
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !mkdir -p ~/.vim/autoload
		silent !curl -fLo ~/.vim/autoload/plug.vim
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		au VimEnter * PlugInstall
	endif
endif

" Plugins
call plug#begin()
	Plug 'tpope/vim-fugitive'
	Plug 'scrooloose/nerdtree'
	Plug 'chriskempson/base16-vim'
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
	Plug 'majutsushi/tagbar'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'w0rp/ale'
	Plug 'rust-lang/rust.vim'
	Plug 'hackerpilot/dcd'
	Plug 'cespare/vim-toml'
	Plug 'elzr/vim-json'
	Plug 'pprovost/vim-ps1'
	Plug 'oranget/vim-csharp'
	Plug 'fatih/vim-go'
	Plug 'idanarye/vim-dutyl'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'reasonml/vim-reason-loader'
	Plug 'uarun/vim-protobuf'
	Plug 'jparise/vim-graphql'
	Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
	Plug 'roxma/nvim-completion-manager'
	Plug 'roxma/ncm-rct-complete'
	Plug 'roxma/clang_complete'
	Plug 'dafufer/nvim-cm-swift-completer'
	Plug 'slashmili/alchemist.vim'
	Plug 'elixir-lang/vim-elixir'
call plug#end()

" Styles
let t_Co=256
let base16colorspace=256
let airline_theme="base16"
let g:airline_powerline_fonts = 1
let g:airline_section_y = '%{ALEGetStatusLine()}'
colorscheme base16-gruvbox-dark-medium

" Lint
let g:ale_linters = {
\	'typescript': ['tslint'],
\	'cpp': ['clang']
\} 
let g:ale_statusline_format = ['⌦ %d', '⚠︎ %d', '✓ ok']
let g:ale_echo_msg_error_str = 'Error'
let g:ale_sign_error = '⌦ '
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Make
let g:typescript_compiler_binary = 'tsc'

" Custom Keybindings
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <F6> :set noet|retab!
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
	\ "\<lt>C-n>" :
	\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
	\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
	\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
autocmd FileType swift nmap <buffer> <C-k> <Plug>(swift_completer_jump_to_placeholder)
autocmd FileType swift imap <buffer> <C-k> <Plug>(swift_completer_jump_to_placeholder)

" Settings
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:used_javascript_libs = 'underscore, react, jquery'
let g:vim_json_syntax_conceal = 0
let g:go_highlight_functions = 0
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_enabled = 0
let g:indentLine_leadingSpaceEnabled = 1

let g:LanguageClient_serverCommands = {
	\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
	\ 'dart': ['dart_language_server']
	\ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" FileType Options
filetype plugin indent on
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd BufRead,BufNewFile *.rs set ft=rust
autocmd BufRead,BufNewFile *.fsx set filetype=fsharp

" Options
set omnifunc=syntaxcomplete#Complete
set noshowmode
set shortmess+=c
set complete+=k
set termguicolors
set fileformats=unix,dos,mac
set completeopt-=preview
set hlsearch
set magic
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set cindent
set listchars=tab:→\  
set regexpengine=1
set ttyfast
set showcmd
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set synmaxcol=1000
set mouse=a
set number
set wildmenu
set splitbelow
set splitright
set laststatus=2
set titlestring=VIM
set noerrorbells
set novisualbell
set background=dark

if has("syntax")
	syntax on
endif

if has('win32')
	let g:vim_home_path = '~/vimfiles'
	set nolist
elseif has('nvim')
	set clipboard+=unnamedplus
	set list
	let g:vim_home_path = '~/.vim'
else
	set list
	let g:vim_home_path = '~/.vim'
endif

" GUI Settings
if has("gui_running")
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
	if has("gui_gtk2")
		set guifont=Operator\ Mono\ Book\ for\ Powerline:h13
	elseif has("gui_macvim")
		set guifont=Operator\ Mono\ Book\ for\ Powerline:h13
	elseif has("gui_win32")
		set guifont=Operator\ Mono\ Book\ for\ Powerline:h13
	endif
endif

if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

highlight htmlArg cterm=italic
highlight Comment cterm=italic
highlight htmlArg gui=italic
highlight Comment gui=italic
