
" PYTHON SETUP
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#ignore_errors = 1
au BufEnter *.py nnoremap <leader>g #call jedi#goto_assignments()
au BufEnter *.py nnoremap <leader>d #call jedi#goto()
au BufEnter *.py nnoremap <leader>o #call jedi#show_documentation()

