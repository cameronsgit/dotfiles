runtime! debian.vim
" Automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall
endif
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
Plug 'flazz/vim-colorschemes'
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
if has('mac')
    Plug 'keith/investigate.vim'
elseif has('unix') || has('win32')
    Plug 'kabbamine/zeavim.vim'
endif
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"" Commands
Plug 'godlygeek/tabular'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-bundler'
"" Completion
Plug 'Valloric/YouCompleteMe'
Plug 'Slava/tern-meteor'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'the-lambda-church/merlin'
Plug 'shawncplus/phpcomplete.vim'
Plug 'jdonaldson/vaxe'
Plug 'dbext.vim'
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
Plug 'https://github.com/othree/es.next.syntax.vim.git'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
"" -- CSS ( and preprocessors )
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'
Plug 'stephenway/postcss.vim'
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
let g:ycm_global_ycm_extra_conf = "~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_dart_bin_folder_path = '/home/sowderca/.local/share/umake/dart/dart-sdk/bin'
let g:ycm_rust_src_path ="/home/sowderca/.multirust/toolchains/1.8.0/src/"
if !empty(system('which opam'))
  " Merlin plugin
  let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
  let g:syntastic_ocaml_checkers=['merlin']

  " Reason plugin which uses Merlin
  let s:reasondir=substitute(system('opam config var share'),'\n$','','') . "/reason"
  execute "set rtp+=".s:reasondir."/editorSupport/VimReason"
  let g:syntastic_reason_checkers=['merlin']
else
endif
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml,reason' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'coffee,haskell,cs,java,javascript,d,python,typescript,perl6,scala,vb,elixir,go,dart' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \   'php': ['->', '::']
  \ }
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
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
let g:tagbar_type_coffee = {
    \ 'ctagstype' : 'coffee',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'm:methods',
        \ 'f:functions',
        \ 'v:variables',
        \ 'f:fields',
    \ ]
\ }
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits,traits',
       \'i:impls,trait implementations',
   \]
   \}
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
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
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_typescript_tsc_args = '--target es6 --jsx preserve'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 'ℹ'
" Styles
let base16colorspace=256
set background=dark
let airline_theme="base16_eighties"
let g:airline_powerline_fonts = 1
colorscheme base16-eighties
let g:flow#enable = 1
let g:flow#autoclose = 1
let g:flow#flowpath = "/bin/flow"
let g:flow#omnifunc = 1
au BufRead,BufNewFile *.js set syntax=typescript
au BufRead,BufNewFile *.jsx set syntax=typescript
au BufRead,BufNewFile *.java set syntax=typescript
au BufRead,BufNewFile *.mjml set syntax=html
au BufRead,BufNewFile web.config set syntax=xml
au BufRead,BufNewFile *.nuspec set syntax=xml
au BufRead,BufNewFile *.babelrc set syntax=json
au BufRead,BufNewFile *.re set ft=reason
au BufRead,BufNewFile *.rei set ft=reason
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType coffee setlocal ts=2 sts=2 sw=2
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimRubyValidate = 0
let g:EclimPythonValidate = 0
let g:dbtext_default_profile_cw='type=SQLSRV:user=sa:passwd=sillyhamster57itchyRo@d24:dbname=cwwebapp_vc3:host=vc3-cw-sql-01'
" Options
if has("autocmd")
  filetype plugin indent on
endif
if has("syntax")
  syntax on
endif
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
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
if has('mac')
   let g:investigate_use_dash=1
endif
set laststatus=2
set titlestring=VIM
syntax enable
if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif
