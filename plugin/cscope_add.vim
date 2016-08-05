function! LoadCscope()
    let db_dir = finddir("cscope", ".;")
    if (!empty(db_dir))
        let db = db_dir . "/cscope.out"
        echo db
        let path = strpart(db, 0, match(db, "cscope/cscope.out$"))
        exe "cs add " .db " " . path
        set cscopeverbose
    endif
endfunction

nnoremap <leader>c :call LoadCscope()<CR>
