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
    Plug 'arcticicestudio/nord-vim'
    Plug 'cespare/vim-toml'
    Plug 'simrat39/symbols-outline.nvim'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'onsails/lspkind-nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'chriskempson/base16-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'dylon/vim-antlr'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'ollykel/v-vim'
    Plug 'fatih/vim-go'
    Plug 'hashivim/vim-terraform'
    Plug 'jvirtanen/vim-hcl'
    Plug 'keith/sourcekittendaemon.vim'
    Plug 'keith/swift.vim'
    Plug 'leafgarland/typescript-vim'
    Plug 'hrsh7th/nvim-compe'
    " Plug 'majutsushi/tagbar'
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'phpactor/phpactor',  {'do': 'composer install', 'for': 'php'}
    Plug 'pprovost/vim-ps1'
    Plug 'rust-lang/rust.vim'
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    " Plug 'scrooloose/nerdcommenter'
    " Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-scripts/MSIL-Assembly'
    Plug 'vim-scripts/applescript.vim'
    " Plug 'w0rp/ale'
   " Plug 'ollykel/v-vim'
    Plug 'yorokobi/vim-splunk'
    " Plug 'junegunn/goyo.vim'
call plug#end()

lua require('config')
" lua require('bufferline').setup{}

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
    autocmd BufRead,BufNewFile *.tf  set filetype=terraform
    autocmd BufRead,BufNewFile *.spl set filetype=splunk
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" Filetype settings
augroup FileSettings
    autocmd!
    autocmd FileType gitcommit call CheckGitCommit()
augroup END

" UI settings
" let g:goyo_width = 180
let base16colorspace = 256
" let airline_theme = 'base16'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#ale#enabled = 1
colorscheme base16-gruvbox-dark-medium

" Linting
" let g:ale_statusline_format = ['⌦ %d', '⚠︎ %d', '✓ ok']
" let g:ale_echo_msg_error_str = 'Error'
" let g:ale_sign_error = '⌦ '
" let g:ale_sign_warning = '⚠'
" let g:ale_echo_msg_warning_str = 'Warning'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0
" let g:ale_set_highlights = 0

" Plugin Settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_hightlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:ale_completion_enabled = 0

if has('macunix')
endif

" let g:tagbar_type_ansible = { 'ctagstype': 'ansible', 'kinds': [ 't:tasks' ], 'sort': 0 }
" let g:tagbar_type_css = { 'ctagstype': 'Css', 'kinds': ['c:classes', 's:selectors', 'i:identities'] }
" let g:tagbar_type_make = { 'kinds':['m:macros', 't:targets'] }
" let g:tagbar_type_ps1 = { 'ctagstype': 'powershell', 'kinds': ['f:function','i:filter','a:alias', 't:test'] }
" let g:tagbar_type_pester = { 'ctagstype': 'pester', 'kinds': ['f:function','i:filter','a:alias', 'm:method'] }
" let g:tagbar_type_ruby = { 'kinds': ['m:modules','c:classes','d:describes','C:contexts','f:methods','F:singleton methods'] }
" let g:tagbar_type_rust = {'ctagstype': 'rust','kinds' : ['T:types,type definitions','f:functions,function definitions','g:enum,enumeration names','s:structure names','m:modules,module names','c:consts,static constants','t:traits','i:impls,trait implementations'] }
" let g:tagbar_type_typescript = {'ctagstype': 'typescript','kinds': ['c:classes','n:modules','f:functions','v:variables','v:varlambdas','m:members','i:interfaces','e:enums']}
" let g:tagbar_type_go = {'ctagstype': 'go','kinds' : ['p:package','f:function','v:variables','t:type','c:const'] }


" Go settings
let g:go_doc_popup_window = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_functions =  1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" COC settings
" let g:coc_global_extensions=[ 'coc-powershell', 'coc-python', 'coc-omnisharp', 'coc-tsserver', 'coc-html', 'coc-json', 'coc-css' ]

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
set wildoptions-=pum
set updatetime=300
set cmdheight=2
set nobackup
set nowritebackup
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

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

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
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" GUI check
let s:is_gui = has('nvim') ? (exists('g:nyaovim_version') || exists('g:GtkGuiLoaded')) : has('gui_running')

" Feature checks
if has('cmdline_hist') | set history=500 | endif
if has('mouse') || s:is_gui | set mouse=a | endif
if has('vertsplit') | set splitright | endif
if has('windows') | set splitbelow | endif
if exists('+termguicolors') | set termguicolors | endif

if has('insert_expand')
  set complete-=i completeopt=noinsert,menuone,preview
  if v:version >= 800
    set completeopt+=noinsert,noselect
  endif
endif

" Version checks
if v:version >= 704 | set expandtab | endif
if v:version >= 800 || has('nvim-0.1.6') | set listchars=tab:→\ ,trail:·,nbsp:• | endif

if has('python')
  set pyx=2
elseif has('python3')
  set pyx=3
endif

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
highlight link goBuiltins Keyword

scriptencoding utf-8
