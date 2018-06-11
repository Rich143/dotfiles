" ----------------------------------------------------------------------------
" DiffRev
" ----------------------------------------------------------------------------
let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)


" Another option:
" It loads a preview window with the result of 'git diff $branchname --name-status' and does a (side by side) Gdiff between branches for file under cursor on gd. It's pretty rudimentary code but maybe someone else will have use for it.
" call it with GDiffBranch master - or whatever other branch or commit you'd like
function! Get_git_root()
    if exists('*fugitive#repo')
    try
        return fugitive#repo().tree()
    catch
    endtry
    endif
    let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
    return v:shell_error ? '' : root
endfunction
function! DiffFile()
    let winheight = winheight(winnr())
    let branchname=b:branchName
    let filename = substitute(getline('.'), '^\w*\s*\(.*\)', '\1', '')
    let gitroot = b:gitroot
    only
    wincmd s
    execute 'resize '.winheight
    wincmd j
    execute 'cd '.gitroot
    execute 'edit '.filename
    execute 'Gdiff '.branchname
endfunction
function! GDiffBranch(branchName)
    let gitroot = Get_git_root()
    let tmpfile = tempname()
    execute 'pedit '.tmpfile
    wincmd P
    let b:branchName=a:branchName
    let b:gitroot = gitroot
    nmap <buffer> q :q<cr>
    execute 'silent read! git diff --name-status '.a:branchName
    normal! ggdd
    resize 12
    setlocal nomodifiable
    nmap <buffer> gd :call DiffFile()<cr>
endfunction
command! -nargs=1 GDiffBranch call GDiffBranch(<q-args>)
