" On Windows, also use '.vim' instead of 'vimfiles'.
if has('win32') || has('win64') || has('win16')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

" Auto-install Vim-Plug.
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
    Plug 'airblade/vim-gitgutter'
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
    Plug 'cespare/vim-toml'
    Plug 'chriskempson/base16-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'fatih/vim-go'
    Plug 'hashivim/vim-terraform'
    Plug 'jvirtanen/vim-hcl'
    Plug 'keith/sourcekittendaemon.vim'
    Plug 'keith/swift.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'majutsushi/tagbar'
    Plug 'ncm2/ncm2'
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-go'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-tmux'
    Plug 'ncm2/ncm2-vim'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'phpactor/ncm2-phpactor'
    Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
    Plug 'pprovost/vim-ps1'
    Plug 'roxma/nvim-yarp'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'arcticicestudio/nord-vim'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/applescript.vim'
    Plug 'dylon/vim-antlr'
    Plug 'w0rp/ale'
    Plug 'vim-scripts/MSIL-Assembly'
call plug#end()

function! CheckGitCommit()
    :3
    setlocal expandtab shiftwidth=2 tabstop=2 textwidth=72 colorcolumn=+1
    if has('spell')
        setlocal spell
    endif
    :highlight SpellBad ctermfg=red ctermbg=white
endfunction

" Filetype commands
augroup SetFileType
    autocmd!
    autocmd BufRead,BufNewFile *.applescript set filetype=applescript
    autocmd BufRead,BufNewFile *.fsx set filetype=fsharp
    autocmd BufRead,BufNewFile *.m   set filetype=objc
    autocmd BufRead,BufNewFile *.mm  set filetype=objcpp
    autocmd BufRead,BufNewFile *.rs  set filetype=rust
augroup END

" Filetype settings
augroup FileSettings
    autocmd!
    autocmd FileType gitcommit call CheckGitCommit()
augroup END

" UI settings
let base16colorspace = 256
let airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
colorscheme base16-gruvbox-dark-medium

" Linting
let g:ale_statusline_format = ['⌦ %d', '⚠︎ %d', '✓ ok']
let g:ale_echo_msg_error_str = 'Error'
let g:ale_sign_error = '⌦ '
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_set_highlights = 0

" Plugin Settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_hightlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:ale_completion_enabled = 0
let g:LanguageClient_autoStart = 1
let g:LanguageClient_hoverPreview = 'Never'
if has('macunix')
    let g:ncm2_pyclang#library_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
endif
autocmd BufEnter * call ncm2#enable_for_buffer()
" Language server settings
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'html': ['html-languageserver', '--stdio'],
    \ 'json': ['json-languageserver', '--stdio'],
    \ 'css': ['css-languageserver', '--stdio'],
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'javascript': ['typescript-language-server', '--stdio'],
    \ 'python': ['pyls'],
    \ 'ps1': ['pwsh', '-NoProfile', '~/.local/share/powershell/Modules/PowerShellEditorServices/Start-EditorServices.ps1', '-HostName', 'nvim', '-HostProfileId', '0', '-HostVersion', '1.0.0', '-BundledModulesPath', '~/.local/share/powershell/Modules/PowerShellEditorServices/modules/', '-LogPath', '/tmp/pses.log', '-LogLevel', 'Diagnostic', '-Stdio', '-SessionDetailsPath', '~/.pses.json'],
    \ 'obc': ['clangd'],
    \ 'objcpp': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd']
\ }

let g:tagbar_type_ansible = { 'ctagstype': 'ansible', 'kinds': [ 't:tasks' ], 'sort': 0 }
let g:tagbar_type_css = { 'ctagstype': 'Css', 'kinds': ['c:classes', 's:selectors', 'i:identities'] }
let g:tagbar_type_make = { 'kinds':['m:macros', 't:targets'] }
let g:tagbar_type_ps1 = { 'ctagstype': 'powershell', 'kinds': ['f:function','i:filter','a:alias', 't:test'] }
let g:tagbar_type_pester = { 'ctagstype': 'pester', 'kinds': ['f:function','i:filter','a:alias', 'm:method'] }
let g:tagbar_type_ruby = { 'kinds': ['m:modules','c:classes','d:describes','C:contexts','f:methods','F:singleton methods'] }
let g:tagbar_type_rust = {'ctagstype': 'rust','kinds' : ['T:types,type definitions','f:functions,function definitions','g:enum,enumeration names','s:structure names','m:modules,module names','c:consts,static constants','t:traits','i:impls,trait implementations'] }
let g:tagbar_type_typescript = {'ctagstype': 'typescript','kinds': ['c:classes','n:modules','f:functions','v:variables','v:varlambdas','m:members','i:interfaces','e:enums']}
let g:tagbar_type_go = {'ctagstype': 'go','kinds' : ['p:package','f:function','v:variables','t:type','c:const'] }

" Custom keybindings
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <F6> :set noet|retab!
" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Minimal desired settings.
set autowrite
set background=dark
set clipboard+=unnamedplus
set cursorline
set fileformats=unix,dos,mac
set guioptions-=L
set guioptions-=T
set guioptions-=m
set guioptions-=r
set hidden
set list
set shiftwidth=4
set number
set shortmess+=c
set titlestring=VIM

" GUI check
let s:is_gui = has('nvim') ? (exists('g:nyaovim_version') || exists('g:GtkGuiLoaded')) : has('gui_running')

" Feature checks
if has('cmdline_hist') | set history=500 | endif
if has('mouse') || s:is_gui | set mouse=a | endif
if has('vertsplit') | set splitright | endif
if has('windows') | set splitbelow | endif

if has('insert_expand')
  set complete-=i completeopt=noinsert,menuone,preview
  if v:version >= 800
    set completeopt+=noinsert,noselect
  endif
endif

" Version checks
if v:version >= 704 | set expandtab | endif
if v:version >= 800 || has('nvim-0.1.6') | set listchars=tab:→\ ,trail:·,nbsp:• | endif

" Try to mimic nvim-defaults.
if !has('nvim')
    " Copied from :help nvim-defaults
    set autoindent
    set autoread
    set backspace=indent,eol,start
    set belloff=all
    set cscopeverbose
    set display=lastline
    set formatoptions=tcqj
    set langnoremap
    set laststatus=2
    set nrformats=bin,hex
    set sidescroll=1
    set smarttab
    set tabpagemax=50
    set ttyfast
    " See :help nvim-from-vim
    set ttymouse=xterm2
    set viminfo+=!
    " Feature checks
    if exists('+fsync') | set nofsync | endif
    if has('autocmd') | filetype plugin indent on | endif
    if has('cmdline_info') | set showcmd ruler | endif
    if has('extra_search') && has('reltime') | set hlsearch incsearch | endif
    if has('mksession') | set sessionoptions-=options | endif
    if has('syntax') && !exists('g:syntax_on') | syntax enable | endif
    if has('wildmenu') |  set wildmenu | endif
    if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
        runtime! macros/matchit.vim
    endif
    if has('multi_byte') && !has('nvim')
        if has('win32') || (has('gui_running') && &encoding ==# 'latin1')
            set encoding=utf-8
        endif
    endif
endif

" Italicize comments
highlight Comment cterm=italic gui=italic
highlight clear ALEErrorSign
highlight clear ALEWarningSign

scriptencoding utf-8
