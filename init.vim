set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" TreeView
Plug 'scrooloose/nerdtree'
" Commenting code
Plug 'tpope/vim-commentary'
" Autocomplete braces
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-slash'
" Multicursor
Plug 'terryma/vim-multiple-cursors'
" Files
Plug 'junegunn/fzf.vim'
" Tagbar (class structure)
Plug 'majutsushi/tagbar'
" Window swap
Plug 'wesQ3/vim-windowswap'
" Git
Plug 'tpope/vim-fugitive'
" Syntax for many languages
Plug 'vim-syntastic/syntastic'
" Easy motion
Plug 'easymotion/vim-easymotion'
" Search
Plug 'mileszs/ack.vim'

" Color schemes
" Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'morhetz/gruvbox'
" Plug 'danilo-augusto/vim-afterglow'
" Plug 'chriskempson/base16-vim'
" Plug 'aradunovic/perun.vim'
" Plug 'mweglarz/spacedust-theme-vim'
" Plug 'geetarista/ego.vim'

" Powerline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code completion
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" CSV
Plug 'TMiguelT/csv.vim'

" Dart + Flutter
Plug 'dart-lang/dart-vim-plugin'

" Kotlin
Plug 'udalov/kotlin-vim'

" Swift plugins
Plug 'keith/swift.vim'

" Javascript plugins
Plug 'othree/html5.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'pangloss/vim-javascript'
"Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Python plugins
Plug 'zchee/deoplete-jedi'

" Go lang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jodosha/vim-godebug'
Plug 'sebdah/vim-delve'

" Initialize plugin system
call plug#end()

" COMMON
let mapleader=","
set nohls
set autowrite
set splitright
set splitbelow
set ignorecase
set smartcase
set background=dark
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
set cc=80
syntax on
" Enable folding
set foldmethod=indent
set foldlevel=99     " Open NERDTree automatically when no file specified
set encoding=utf-8
" autocmd BufRead * set scroll=20
" Auto save
autocmd FocusLost * :wa
" Relative number
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END
set number relativenumber

" Windows // preview window
set previewheight=6
:botright cwindow
augroup previewWindowPosition
   au!
   autocmd BufWinEnter * call PreviewWindowPosition()
augroup END
function! PreviewWindowPosition()
   if &previewwindow
      wincmd J
   endif
endfunction 

" Commenting code
map <leader>c<space> :Commentary<CR>

" Tagbar
let g:tagbar_autopreview=1
let g:tagbar_autoclose=0
let g:tagbar_autofocus=1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NerdTree with Ctrl+n
map <C-c> :NERDTreeToggle<CR>
map <C-s> :TagbarToggle<CR>

" always show powerline
set laststatus=2

" Color schemes
set termguicolors     " enable true colors support
" let ayucolor="dark" " for dark version of theme
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
colorscheme gruvbox
let g:airline_powerline_fonts = 1

" Path to python interpreter for neovim
" mac os 
" let g:python3_host_prog  = '/Users/mweglarz/bin/python'
" linux
" let g:python3_host_prog  = '/usr/bin/python3'
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1
" To disable python 2
let g:loaded_python_provider = 1

nnoremap <space> za
nnoremap <C-h>s :set hlsearch!<CR>
nnoremap <C-h>n :set nohls<CR>

" Close preview window when done completing
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" let g:AutoPairsShortcutToggle = '<D-p>'
let g:AutoPairsShortcutFastWrap = '<C-e>'
" let g:AutoPairsShortcutJump = '<D-n>'
" let g:AutoPairsShortcutBackInsert = '<D-b>'
"
au! BufNewFile,BufRead Podfile setf ruby
au! BufNewFile,BufRead *.podspec setf ruby
"
"
" LSP setup
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'swift': ['~/Development/swift/sourcekit-lsp/.build/debug/sourcekit-lsp'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <leader>d :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" SWIFT SETUP
source ~/.config/nvim/init_swift.vim

" JAVASCRIPT SETUP
source ~/.config/nvim/init_js.vim

" PYTHON SETUP
source ~/.config/nvim/init_python.vim

" GO LANG SETUP
source ~/.config/nvim/init_go.vim

"FZF
nnoremap <leader>of :Files<CR>

" neosnippet setup
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/mw-snippets'
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['go'] = 'go, common'
let g:neosnippet#enable_completed_snippet = 1

" deoplete.nvim recommend
set completeopt+=longest
" For conceal markers.
if has('conceal')
  set conceallevel=1
  " set conceallevel=1 concealcursor=niv
endif

if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

set rtp+=~/.fzf

