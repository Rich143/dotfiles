if has("cscope")
    let s:cs_gen_script = "~/.vim/Scripts/update_scopedb.sh"
    let s:cs_exe = "/usr/local/bin/cscope"
    let s:cs_db = getcwd() . "/cscope.out"

    function! Make_args(cmd)
        let l:outcmd = []
        for cmdarg in a:cmd
            " Thanks Vimscript... you can use negative integers for strings
            " in the slice notation, but not for indexing characters :(
            let l:arglen = strlen(cmdarg)
            if (cmdarg[0] == '"' && cmdarg[l:arglen - 1] == '"') || 
                        \(cmdarg[0] == "'" && cmdarg[l:arglen - 1] == "'")
                call add(l:outcmd, cmdarg[1:-2])
            else
                call add(l:outcmd, cmdarg)
            endif
        endfor
        return l:outcmd
    endfunction
    function! s:handler(job_id, data, event_type)
        echo a:job_id . ' ' . a:event_type
        echo join(a:data, "\n")
    endfunction
    function! CommandClose(channel)
        exe "cfile! " . g:backgroundCommandOutput
        copen
        unlet g:backgroundCommandOutput
    endfunc
    function! CsGenCompleteCallback(job, exit_val)
        echom "Cscope gen complete!"
    endfunc
    function! CsGenDB()
        let l:cwd = getcwd()
        let l:cmd = [s:cs_gen_script]
        let l:cmd += ['-e', s:cs_exe]
        let l:cmd += ['-p', l:cwd]
        let l:cmd += ['-f', s:cs_db]
        "let l:cmd += ['> cscope.vim.log']
        let l:cmd = Make_args(l:cmd)
        echom string(l:cmd)
        echom join(l:cmd, " ")
        let l:str_cmd = join(l:cmd, " ")

        "echom 'Here'
        "let jobid = async#job#start(l:str_cmd, {
            "\ 'on_stdout': function('s:handler'),
            "\ 'on_stderr': function('s:handler'),
            "\ 'on_exit': function('s:handler'),
        "\ })

        "if jobid > 0
            "echom 'job started'
        "else
            "echom 'job failed to start'
        "endif

        "" If you want to wait the job:
        ""call async#job#wait([jobid], 5000)  " timeout: 5 sec

        exe '!' . l:str_cmd
        echom "cscope add " . s:cs_db
        exe "cscope add " . s:cs_db
        "let g:backgroundCommandOutput = tempname()
        "let job = job_start(l:cmd, {'close_cb': 'CommandClose', 'exit_cb': 'CsGenCompleteCallback', 'out_io': 'file', 'out_name': g:backgroundCommandOutput} )
    endfunc
    function! CsLoadDb()
        echom "cscope add " . s:cs_db
        exe "cscope add " . s:cs_db
    endfunc
endif
