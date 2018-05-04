
" GO LANG SETUP
au FileType go nmap <leader>r <Plug>(go-run-tab)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>tf <Plug>(go-test-func)
au FileType go nmap <leader>d <Plug>(go-doc-tab)
au FileType go nmap <leader>i :GoImpl<CR>
au FileType go nmap <leader>tt <Plug>(go-alternate-edit)
au FileType go nmap <leader>tv <Plug>(go-alternate-vertical)
au FileType go nmap <leader>th <Plug>(go-alternate-split)
au FileType go nmap <leader>tb <Plug>(go-test-compile)
au FileType go nmap gb <Plug>(go-def-pop)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <leader>dt :GoToggleBreakpoint<CR>
au FileType go nmap <leader>dr :GoDebug<CR>

au FileType go nmap <leader>en :cnext<CR>
au FileType go nmap <leader>ep :cprevious<CR>
au FileType go nmap <leader>ec :cclose<CR>

au FileType go nmap <leader>ln :lnext<CR>
au FileType go nmap <leader>lp :lprevious<CR>
au FileType go nmap <leader>lc :lclose<CR>

let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_arguments = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_auto_sameids = 0
let g:go_auto_type_info = 1
let g:go_test_show_name = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


