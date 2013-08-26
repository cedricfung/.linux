" ===============================================================================
" Author: Cedric Fung <cedric@vec.io>
" Platform: Arch Linux, Vim 7.3
"
" INSTALL:
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim  ~/.vim/bundle/neobundle.vim
" $ vim
" ===============================================================================

set nocompatible

set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
" Navigation
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'spiiph/vim-space'
NeoBundle 'Lokaltog/vim-easymotion'
" UI Additions
NeoBundle 'mutewinter/vim-indent-guides'
NeoBundle 'godlygeek/csapprox'
NeoBundle 'Rykka/colorv.vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
" Commands
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'godlygeek/tabular'
" Automatic Helpers
NeoBundle 'IndexedSearch'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mhinz/vim-startify'
" Language Additions
NeoBundle 'dag/vim2hs'
NeoBundle 'vecio/lispp.vim'
NeoBundle 'https://bitbucket.org/kovisoft/slimv', { 'type': 'hg' }
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-haml'
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'leshill/vim-json'
NeoBundle 'othree/html5.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'groenewege/vim-less'
NeoBundle 'avakhov/vim-yaml'
NeoBundle 'vim-scripts/DrawIt'
NeoBundle 'git://fedorapeople.org/home/fedora/wwoods/public_git/vim-scripts.git'
NeoBundle 'Shougo/vinarise.vim'
" Libraries
NeoBundle 'L9'
NeoBundle 'tpope/vim-repeat'

NeoBundleCheck
filetype plugin indent on

" -------------
" Interface
" -------------
set ruler
set number
set wrap
set laststatus=2
set cmdheight=1
set colorcolumn=128
set cursorline
set cursorcolumn
set showmatch
set matchtime=2
set mousehide
set mouse=a
set noerrorbells
set novisualbell
set t_Co=256
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_visibility='low'
syntax enable

" ---------------
" Text format
" ---------------
set encoding=utf-8
set cindent
set autoindent
set smarttab
set expandtab
set tabstop=2
set backspace=2
set shiftwidth=2
set backspace=2

" ---------------
" Behaviors
" ---------------
set autoread
set autowrite
set wildmenu
set hidden
set history=1024
set updatetime=1000
set cf
set clipboard+=unnamed
set timeoutlen=250
set foldlevelstart=99
set formatoptions=tcq
set complete=.,w,b,u,U
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set smartcase
set incsearch
set hlsearch

" Set leader to ,
let mapleader=","

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Common tasks
imap <C-l> <C-x><C-l>
nmap <leader>q' ciw'<Esc>p<Esc>

" ----------------------------------------
" Auto commands
" ----------------------------------------
" :o formatting on o key newlines
autocmd BufNewFile,BufEnter * set formatoptions-=o
" No more complaining about untitled documents
autocmd FocusLost silent! :wa
" When editing a file, always jump to the last cursor position.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line ("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" When save a file, strip the spaces in the end
autocmd BufWritePre * :%s/\s\+$//ge
" Set omnifunc for those withou that
autocmd Filetype *
      \ if &omnifunc == "" |
      \   setlocal omnifunc=syntaxcomplete#Complete |
      \ endif

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>

" ---------------
" startify
" ---------------
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_show_sessions = 1
let g:startify_show_files = 1
let g:startify_show_files_number = 10
let g:startify_bookmarks = [ '~/.vimrc' ]

" ---------------
" unite.vim
" ---------------
let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 1000
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '» '
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '-H --nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
nnoremap <C-p> :Unite buffer file_rec/async file_mru<CR>
nnoremap <C-\> :Unite file<CR>
nnoremap <C-g> :Unite grep:.<CR>

" ---------------
" vimshell
" ---------------
let g:vimshell_temporary_directory = expand('~/.vim/cache/vimshell')
let g:vimshell_force_overwrite_statusline = 0

" ---------------
" vimfiler
" ---------------
let g:vimfiler_data_directory = '~/.vim/cache/vimfiler'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_force_overwrite_statusline = 0
nnoremap <C-n> :VimFilerExplorer<CR>

" ---------------
" airline
" ---------------
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline#extensions#branch#symbol = '⎇ '
let g:airline#extensions#paste#symbol = 'Þ'
let g:airline#extensions#whitespace#symbol = 'Ξ'

" ---------------
" neocomplete.vim
" ---------------
let g:neocomplete#data_directory = '~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#max_list = 100
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#tags#cache_limit_size = 8192000
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#dictionary#dictionaries = {}
let g:neocomplete#sources#vim#complete_functions = {
      \ 'Ref' : 'ref#complete',
      \ 'Unite' : 'unite#complete_source',
      \ 'VimFiler' : 'vimfiler#complete',
      \ 'Vinarise' : 'vinarise#complete',
      \ 'VimShell' : 'vimshell#complete',
      \ 'VimShellExecute' : 'vimshell#vimshell_execute_complete',
      \ 'VimShellTerminal' : 'vimshell#vimshell_execute_complete',
      \ 'VimShellInteractive' : 'vimshell#vimshell_execute_complete',
      \}
let g:neocomplete#keyword_patterns = {
      \ '_' : '[0-9a-zA-Z:#_]\+',
      \}
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() : "\<C-r>\""
inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
inoremap <expr><C-x><C-f> neocomplete#start_manual_complete('file')
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" : neocomplete#start_manual_complete()
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" neosnippet.vim"
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'
imap <silent><C-k> <Plug>(neosnippet_expand_or_jump)
smap <silent><C-k> <Plug>(neosnippet_expand_or_jump)

" ---------------
" gundo.vim
" ---------------
let g:gundo_width = 32
let g:gundo_preview_height = 16

" ---------------
" indent-guides
" ---------------
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=5
let g:indent_guides_guide_size=1
nmap <silent> <leader>i :IndentGuidesToggle<CR>

" ---------------
" Tabular
" ---------------
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,\zs<CR>
vmap <leader>t, :Tabularize /,\zs<CR>
nmap <leader>t> :Tabularize /=>\zs<CR>
vmap <leader>t> :Tabularize /=>\zs<CR>

" ---------------
" zencoding
" ---------------
let g:user_zen_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \  'xml' : {
      \    'extends' : 'html',
      \  },
      \  'haml' : {
      \    'extends' : 'html',
      \  },
      \  'eruby' : {
      \    'extends' : 'html',
      \  },
      \}

" ---------------
" vim-javascript
" ---------------
let g:html_indent_inctags = "body,head,tbody"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"
let g:html_indent_sciript1 = "inc"
let g:html_indent_style1 = "inc"

" ---------------
" slimv
" mit-scheme
" ---------------
let g:slimv_impl = 'mit'
let g:slimv_disable_clojure = 1
let g:slimv_disable_lisp = 1
let g:scheme_builtin_swank = 1

" ---------------
" vim2hs
" ---------------
let g:haskell_hsp = 0

" --------------
" syntastic
" --------------
let g:syntastic_ignore_files = ['^/usr/include/']
let g:syntastic_c_config_file = '.syntastic_c_config'
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=c99 -Wall'
