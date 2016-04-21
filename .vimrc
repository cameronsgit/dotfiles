runtime! debian.vim
" Plugins 
" -------------------------------------------------
call plug#begin()
" Interface
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Code Display
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chriskempson/base16-vim'
Plug 'Align'
Plug 'yggdroot/indentline'
"" Integrations
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'facebook/vim-flow'
Plug 'tpope/vim-dispatch'
Plug 'ramitos/jsctags'
Plug 'keith/travis.vim'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/gem-ctags'
Plug 'TaskList.vim'
Plug 'jakedouglas/exuberant-ctags'
Plug 'sjl/gundo.vim'
Plug 'jscs-dev/node-jscs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"" Commands
Plug 'godlygeek/tabular'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-bundler'
"" Completion
Plug 'Valloric/YouCompleteMe'
Plug 'Slava/tern-meteor'
Plug 'marijnh/tern_for_vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'jdonaldson/vaxe'
"" Languages
"" -- Dart
Plug 'dart-lang/dart-vim-plugin'
"" -- Scala
Plug 'derekwyatt/vim-scala'
Plug 'ktvoelker/sbt-vim'
"" -- Coffee
Plug 'kchmck/vim-coffee-script'
"" -- Ruby 
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'muz/vim-gemfile'
"" -- Rust
Plug 'wting/rust.vim'
"" -- Javascript ( and Typescript )
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
"" -- CSS ( and preprocessors )
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'groenewege/vim-less'
"" -- Elixir
Plug 'elixir-lang/vim-elixir'
"" -- Swift
Plug 'keith/swift.vim'
"" -- Go
Plug 'fatih/vim-go'
"" -- Powershell
Plug 'PProvost/vim-ps1'
"" -- CSV
Plug 'chrisbra/csv.vim'
"" -- Markdown
Plug 'tpope/vim-markdown'
"" -- JSON
Plug 'elzr/vim-json'
"" -- HTML ( and other markups )
Plug 'digitaltoad/vim-jade'
Plug 'othree/html5.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'Slava/vim-spacebars'
"" -- PHP
Plug 'StanAngeloff/php.vim'
"" -- Crystal
Plug 'rhysd/vim-crystal'
"" -- C ( and other C'ish languages )
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'OrangeT/vim-csharp'
"" -- F# 
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
"" -- Mis
Plug 'markcornick/vim-vagrant'
Plug 'xolox/vim-misc'
Plug 'ekalinin/Dockerfile.vim'
Plug 'b4b4r07/vim-hcl'
Plug 'crontab.vim'
call plug#end()
" Settings
" -------------------------------------------------
let g:ycm_path_to_python_interpreter ='/home/sowderca/.pyenv/shims/python3'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_rust_src_path = '/usr/local/rust/rustc-1.5.0/src'
let g:ycm_dart_bin_folder_path = '/home/sowderca/.local/share/umake/dart/dart-sdk/bin'
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'coffee,haskell,cs,java,javascript,d,python,typescript,perl6,scala,vb,elixir,go,dart' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'php': ['->', '::']
  \ }
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
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
let g:tlWindowPosition = 1
so /home/sowderca/.vim/plugged/vim-flow/autoload/flowcomplete.vim
set completeopt-=preview
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_enabled=0
let g:indentLine_leadingSpaceEnabled=1
" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_ballons = 1
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = 'xo'
let g:syntastic_javascript_eslint_args = '--compact'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 'ℹ'
" Styles
let base16colorspace=256
set background=dark
let airline_theme="base16"
let g:airline_powerline_fonts = 1
colorscheme base16-default
let g:flow#enable = 1
let g:flow#autoclose = 1
let g:flow#flowpath = "/bin/flow"
let g:flow#omnifunc = 1
au BufRead,BufNewFile *.js set syntax=typescript
au BufRead,BufNewFile *.jsx set syntax=typescript
au BufRead,BufNewFile *.java set syntax=typescript
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimRubyValidate = 0
let g:EclimPythonValidate = 0
" Options
if has("autocmd")
  filetype plugin indent on
endif
if has("syntax")
  syntax on
endif
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cindent
set list
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set mouse=a
set number
set wildmenu
if has('nvim')
    set clipboard+=unnamedplus
endif
set laststatus=2
set titlestring=VIM
syntax enable
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif
