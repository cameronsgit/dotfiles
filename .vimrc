runtime! debian.vim
call plug#begin()
Plug 'Align'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'joshhartigan/vim-reddit'
Plug 'itchyny/calendar.vim'
Plug 'lilydjwg/colorizer'
Plug 'crontab.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jakedouglas/exuberant-ctags'
Plug 'tpope/gem-ctags'
Plug 'JavaScript-Indent'
Plug 'ramitos/jsctags'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'walm/jshint.vim'
Plug 'eagletmt/neco-ghc'
Plug 'leafo/moonscript-vim'
Plug 'scrooloose/nerdtree'
Plug 'othree/tern_for_vim_coffee'
Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'scrooloose/syntastic'
Plug 'mustache/vim-mustache-handlebars'
Plug 'godlygeek/tabular'
Plug 'ngmy/vim-rubocop'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim'
Plug 'tpope/vim-fugitive'
Plug 'Slava/tern-meteor'
Plug 'Quramy/tsuquyomi'
Plug 'xolox/vim-easytags'
Plug 'derekwyatt/vim-scala'
Plug 'leafgarland/typescript-vim'
Plug 'utl.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'fatih/vim-go'
Plug 'Shougo/vimproc.vim'
Plug 'Blackrush/vim-gocode'
Plug 'markcornick/vim-vagrant'
Plug 'bling/vim-airline'
Plug 'tpope/vim-bundler'
Plug 't9md/vim-chef'
Plug 'mtscout6/vim-cjsx'
Plug 'kchmck/vim-coffee-script'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rhysd/vim-crystal'
Plug 'OrangeT/vim-csharp'
Plug 'tpope/vim-dispatch'
Plug 'elixir-lang/vim-elixir'
Plug 'muz/vim-gemfile'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'groenewege/vim-less'
Plug 'shime/vim-livedown'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'
Plug 'tpope/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'moll/vim-node'
Plug 'tpope/vim-rails'
Plug 'Slava/vim-spacebars'
Plug 'tpope/vim-speeddating'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wakatime/vim-wakatime'
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
Plug 'Valloric/YouCompleteMe'
call plug#end()
autocmd vimenter * NERDTree
let base16colorspace=256
let $PATH = $PATH . ':' . expand("~/.cabal/bin")
set background=dark
let g:airline_theme="base16"
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
if has("syntax")
  syntax on
endif
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['mri']
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:clang_library_path = '/home/sowderca/.vim/bundle/YouCompleteMe/third_party/ycmd/'
if has("autocmd")
  filetype plugin indent on
endif
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'haskell,cs,java,javascript,d,python,typescript,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'php': ['->', '::']
  \ }
let g:easytags_languages = {
              \   'javascript': {
              \       'cmd': 'jsctags',
              \       'args': [],
              \       'fileoutput_opt': '-f',
              \       'stdout_opt': '-f-',
              \       'recurse_flag': '-R'
              \   }
             \}
let g:EclimCompletionMethod = 'omnifunc'
let g:haskellmode_completion_ghc = 0
autocmd Filetype haskell setlocal omnifunc=necoghc#omnifunc
autocmd Filetype php set omnifunc=phpcomplete#CompletePHP
autocmd Filetype php set completefunc=phpcomplete#CompletePHP
set tabstop=4
set shiftwidth=4    " Indents will have a width of 4
let g:lua_check_syntax = 0
let g:lua_complete_keywords = 0 
let g:lua_complete_omni = 1
let g:lua_internal = 0
let softtabstop=4   " Sets the number of columns for a TAB
set completeopt-=preview
set expandtab       " Expand TABs to spaces
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set softtabstop=4
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number
set wildmenu
let g:padawan#timeout = 0.1
let g:hybrid_use_Xresources = 1
set laststatus=2
colorscheme base16-default
syntax enable
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local 
endif 
