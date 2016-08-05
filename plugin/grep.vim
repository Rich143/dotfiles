" Load only once.
"if exists('loaded_sc')
    "finish
"endif
"let loaded_sc = 1

"function! Sc(pattern)
    "grep --include={*.c,*.cpp,*.h,*.hpp,*.py} -R a:pattern
"endfunction

"nnoremap K :vimgrep "\b<C-R><C-W>\b"  **/*.c **/*.cpp **/*.h **/*.hpp **/*.py<CR>

"nnoremap S :grep! "\b<C-R><C-W>\b" **/*.c **/*.cpp **/*.h **/*.hpp<CR>:cw<CR>
"nnoremap A :grep! "<C-R><C-W>" **/*.c **/*.cpp **/*.h **/*.hpp<CR>:cw<CR>
