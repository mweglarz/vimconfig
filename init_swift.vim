
autocmd BufNewFile,BufRead *.swift set filetype=swift
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
