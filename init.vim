set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" TreeView
Plug 'scrooloose/nerdtree'

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

" Color schemes
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'morhetz/gruvbox'
Plug 'danilo-augusto/vim-afterglow'
Plug 'chriskempson/base16-vim'

" Powerline for vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Python plugins
Plug 'zchee/deoplete-jedi'

" Go lang plugins
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'jodosha/vim-godebug'
" Plug 'ctrlpvim/ctrlp.vim'

" Initialize plugin system
call plug#end()

" COMMON
set nohls
set autowrite
set splitright
set splitbelow
set nu
set ignorecase
set smartcase
set background=dark
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
syntax on
" Enable folding
set foldmethod=indent
set foldlevel=99     " Open NERDTree automatically when no file specified
set encoding=utf-8

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NerdTree with Ctrl+n
map <C-c> :NERDTreeToggle<CR>
map <C-s> :TagbarToggle<CR>

" always show powerline
set laststatus=2

" Color schemes
set termguicolors     " enable true colors support
colorscheme base16-gruvbox-dark-hard
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'

let mapleader=","

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
  set conceallevel=1 concealcursor=niv
endif

set rtp+=~/.fzf

