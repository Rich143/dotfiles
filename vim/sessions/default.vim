" ~/dotfiles/vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 26 July 2018 at 09:55:56.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egmrL
silent! set guifont=Monaco:h14
if exists('g:syntax_on') != 0 | syntax off | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'solarized8_flat' | colorscheme solarized8_flat | endif
call setqflist([])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Src/coreos-tests/CoreOSTests
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 EFIDisplayTest/efidisplaytest.py
badd +1 KASanTest/kasan.py
badd +1 libtrace/libtrace.py
badd +1 ~/Src/bats-lib/setup.py
badd +604 ~/Src/bats-lib/bats/sdk.py
badd +30 ~/Src/bats-lib/bats/test/disk_io.py
badd +35 valid/tools/valid-switch.py
badd +167 platformUtil/USB/Baselines/N56APBaseline.plist
badd +28 sleep_restart/restart_cycler.ptest
badd +74 sleep_restart/sleep_cycler.ptest
badd +8 XCPMTests/Intel_CPU_Sanity_Test_files/tests/test_ioppf_smc.sh
badd +1 OSD/osdlib/osd_device_identities.py
badd +77 Setup/restore/etc/register_ip.sh
badd +165 Setup/restore/eraseInstall.ptest
badd +163 CoreML/CoreMLPerformanceTests.py
badd +71 CoreML/CoreMLPerformanceTests.ptest
badd +209612 numerics/SPECint/SPEC2006/400.perlbench/lib/spam.pl
badd +340 SMC_Gibraltar/STATE_SleepWake_ForceS3.py
badd +472 SMC_Gibraltar/STATE_SleepWake_MD.py
badd +47 SMC_Gibraltar/SST/S4_Standby.py
badd +52 SMC_Gibraltar/SST/S3_Sleep.py
badd +95 SMC_Gibraltar/SST/S5_Hibernate.py
badd +50 SMC_Gibraltar/SST/S0i_Sleep.py
badd +265 SMC_Gibraltar/STATE_SleepWake_ForceS3_MD.py
badd +151 SMC_Gibraltar/STATE_SleepWake.py
badd +627 SMC_Gibraltar/STATE_SleepWake_ForceS5.py
badd +8 SMC_Gibraltar/STATE_SleepWake_ForceS4.py
badd +1 OSD/osdlib/component_check.py
badd +1009515 numerics/SPECint/SPEC2006/456.hmmer/swiss41
badd +34 paniclog/paniclog_bridge.py
badd +1 RXPC_Tests/RXPC_sleepCycler.py
badd +106 ~/.vimrc
argglobal
silent! argdel *
set stal=2
edit EFIDisplayTest/efidisplaytest.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 104 + 157) / 315)
exe 'vert 2resize ' . ((&columns * 105 + 157) / 315)
exe 'vert 3resize ' . ((&columns * 104 + 157) / 315)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 35 - ((34 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
35
normal! 059|
wincmd w
argglobal
if bufexists('~/.vimrc') | buffer ~/.vimrc | else | edit ~/.vimrc | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 141 - ((0 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
141
normal! 0
wincmd w
argglobal
if bufexists('KASanTest/kasan.py') | buffer KASanTest/kasan.py | else | edit KASanTest/kasan.py | endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 23 - ((20 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 021|
wincmd w
exe 'vert 1resize ' . ((&columns * 104 + 157) / 315)
exe 'vert 2resize ' . ((&columns * 105 + 157) / 315)
exe 'vert 3resize ' . ((&columns * 104 + 157) / 315)
tabedit libtrace/libtrace.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 157) / 315)
exe 'vert 2resize ' . ((&columns * 283 + 157) / 315)
argglobal
enew
" file NERD_tree_2
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 20 - ((19 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 027|
wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 157) / 315)
exe 'vert 2resize ' . ((&columns * 283 + 157) / 315)
tabedit OSD/osdlib/osd_device_identities.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 51 + 157) / 315)
exe '2resize ' . ((&lines * 55 + 36) / 72)
exe 'vert 2resize ' . ((&columns * 263 + 157) / 315)
exe '3resize ' . ((&lines * 15 + 36) / 72)
exe 'vert 3resize ' . ((&columns * 263 + 157) / 315)
argglobal
enew
" file NERD_tree_5
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 54 - ((53 * winheight(0) + 27) / 55)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
54
normal! 021|
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
exe 'vert 1resize ' . ((&columns * 51 + 157) / 315)
exe '2resize ' . ((&lines * 55 + 36) / 72)
exe 'vert 2resize ' . ((&columns * 263 + 157) / 315)
exe '3resize ' . ((&lines * 15 + 36) / 72)
exe 'vert 3resize ' . ((&columns * 263 + 157) / 315)
tabedit OSD/osdlib/component_check.py
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 60 + 36) / 72)
exe '2resize ' . ((&lines * 10 + 36) / 72)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 60 - ((48 * winheight(0) + 30) / 60)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
60
normal! 036|
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
exe '1resize ' . ((&lines * 60 + 36) / 72)
exe '2resize ' . ((&lines * 10 + 36) / 72)
tabedit RXPC_Tests/RXPC_sleepCycler.py
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 67 + 157) / 315)
exe '2resize ' . ((&lines * 45 + 36) / 72)
exe 'vert 2resize ' . ((&columns * 247 + 157) / 315)
exe '3resize ' . ((&lines * 25 + 36) / 72)
exe 'vert 3resize ' . ((&columns * 247 + 157) / 315)
argglobal
enew
" file __Tag_List__
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=9999
setlocal fml=0
setlocal fdn=20
setlocal fen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 8 - ((7 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 011|
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
exe 'vert 1resize ' . ((&columns * 67 + 157) / 315)
exe '2resize ' . ((&lines * 45 + 36) / 72)
exe 'vert 2resize ' . ((&columns * 247 + 157) / 315)
exe '3resize ' . ((&lines * 25 + 36) / 72)
exe 'vert 3resize ' . ((&columns * 247 + 157) / 315)
tabedit paniclog/paniclog_bridge.py
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 30 - ((29 * winheight(0) + 35) / 71)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
30
normal! 030|
tabnext 1
set stal=1
if exists('s:wipebuf') && s:wipebuf != bufnr('%')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

3wincmd w
tabnext 3
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
cwindow
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 70|vert 1resize 51|2resize 54|vert 2resize 263|3resize 15|vert 3resize 263|
2wincmd w
tabnext 4
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
cwindow
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 59|vert 1resize 315|2resize 10|vert 2resize 315|
1wincmd w
tabnext 5
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
Tlist
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
3wincmd w
tabnext 5
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
cwindow
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 70|vert 1resize 67|2resize 44|vert 2resize 247|3resize 25|vert 3resize 247|
1wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
