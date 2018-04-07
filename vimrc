let g:python_host_prog='/usr/bin/python'
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" Python autoindent
Plugin 'vim-scripts/indentpython.vim'

" Plugin for autocompletion
" Plugin 'Valloric/YouCompleteMe'

" Apple swift syntax highlighter workaround
Plugin 'mweglarz/vim-swift'

" gonvim plugin
Plugin 'equalsraf/neovim-gui-shim'

"...
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" noremap ; l
" noremap l k
" noremap k j
" noremap j h

" Match bracets
" ino " ""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
" ino { {}<left>
" ino {<CR> {<CR>}<ESC>O

syntax on

" Enable folding
set foldmethod=indent
set foldlevel=99

au BufNewFile,BufRead *.py
    \ set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    " \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
    
au BufEnter *.py vnoremap <C-_> :norm I# <CR>
au BufEnter *.py vnoremap <C-_>u :s/^#\ //<CR> :nohls<CR>
    
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set encoding=utf-8

set nu
set mouse=a
set ic

" NERDTree setup
"
map <C-r> :!./main<CR>

" Cursor settings
let &t_SI = "\<esc>[5 q"
let &t_SR = "\<esc>[5 q"
let &t_EI = "\<esc>[2 q"

au FileType py map <leader>g :YcmCompleter GoTo<CR>
let g:ycm_goto_buffer_command='new-or-existing-tab'
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = 'python'
let g:ycm_filetype_specific_completion_to_disable = { 'go': 1 }

hi MatchParen cterm=none ctermbg=green ctermfg=blue


