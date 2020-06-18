"
" Richard Matthews
" December 18, 2017
"

set nocompatible              " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'altercation/vim-colors-solarized'

"Plug 'tmhedberg/SimpylFold'

"Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree'

Plug 'ludovicchabant/vim-gutentags'

Plug 'scrooloose/nerdcommenter'

Plug 'vim-scripts/taglist.vim'

Plug 'vim-scripts/TaskList.vim'

"Plug 'unblevable/quick-scope'

Plug 'wellle/targets.vim'

Plug 'ntpeters/vim-better-whitespace'

"Plug 'tpope/vim-obsession'

"Plug 'chrisbra/Recover.vim'

"Plug 'rking/ag.vim'

Plug 'mileszs/ack.vim'

"Plug 'Chun-Yang/vim-action-ag'

Plug 'yssl/QFEnter'

" Potential slowdown of insert mode
"Plug 'Yggdroot/indentLine'

"Plug 'ctrlpvim/ctrlp.vim'

Plug 'jlanzarotta/bufexplorer'

Plug 'vim-scripts/vcscommand.vim'

Plug 'tpope/vim-surround'

Plug 'bkad/CamelCaseMotion'

"Plug 'rust-lang/rust.vim'

Plug 'tpope/vim-fugitive'

"Plug 'vim-scripts/Conque-GDB'

Plug 'ajh17/VimCompletesMe'

Plug 'octref/RootIgnore'

"Plug 'djmoch/vim-makejob'

"Plug 'tpope/vim-dispatch'

Plug 'itchyny/lightline.vim'

"Plug 'Shougo/vimproc.vim', {'do' : 'make'}


Plug 'tpope/vim-sleuth'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'tommcdo/vim-kangaroo'

"Plug 'vim-scripts/cvsdiff.vim'

""https://github.com/vim-scripts/DoxygenToolkit.vim
Plug 'mrtazz/DoxygenToolkit.vim'

" VIM LSP Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'alessandroyorba/despacio' alternate color scheme

"Plug 'arnar/vim-matchopen'
"Plug 'vim-scripts/Highlight-UnMatched-Brackets'

"Plug 'ervandew/supertab'

" Plug 'vim-scripts/cscope.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

nnoremap <Space> <Nop>
let mapleader="\<space>"

if has('mouse')
   set mouse=a
endif

set number

nnoremap <C-n> <C-I>

if !exists('set_syntax')
   syntax enable
   set background=dark
   let g:solarized_termtrans = 1
   set guifont=Monaco:h12
   colorscheme solarized

   "set t_Co=256
   "let g:solarized_termcolors=256
   "let g:solarized_termcolors=16
   let g:solarized_contrast="high"
   let g:solarized_visibility="high"
   let g:solarized_menu=1

   let set_syntax = 1
endif

set hlsearch
nnoremap <leader>h :noh<CR>

set splitbelow
set splitright

"split navigations
nnoremap <C-j> <C-W><C-J>
nnoremap <C-k> <C-W><C-K>
nnoremap <C-l> <C-W><C-L>
nnoremap <C-h> <C-W><C-H>

nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

"let g:tmux_navigator_no_mappings = 1
"
"nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
"nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
"nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>

" use <C-6> for previous buffer

" Enable folding
"set foldmethod=indent
"set foldlevel=99
" Disable folding
set nofoldenable
set foldlevel=0
set foldmethod=manual

" nnoremap <space> za

" Latex
"au BufNewFile,BufRead *.tex set tw=79
au BufNewFile,BufRead *.tex set spell

" Python indentation
au BufNewFile,BufRead *.py call SetPythonOptions()

function! SetPythonOptions()
       set tabstop=4
       set softtabstop=4
       set shiftwidth=4
       "set textwidth=79
   set textwidth=0
   set wrapmargin=0
       set expandtab
       set autoindent
       set fileformat=unix
       set encoding=utf-8
endfunction


vnoremap < <gv
vnoremap > >gv

set smartcase
set ignorecase

" Cscope.vim
"nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>
"" s: Find this C symbol
"nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
"" g: Find this definition
"nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
"" d: Find functions called by this function
"nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
"" c: Find functions calling this function
"nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
"" t: Find this text string
"nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
"" e: Find this egrep pattern
"nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
"" f: Find this file
"nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
"" i: Find files #including this file
"nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>


"NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

"guten-tags
let g:gutentags_project_root=['.svn']
let g:gutentags_define_advanced_commands=1
"let g:gutentags_trace=1

" resize
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>= :resize +5<CR>
nnoremap <leader>, :vertical resize -5<CR>
nnoremap <leader>. :vertical resize +5<CR>

hi User1 ctermbg=0 ctermfg=3
hi User2 ctermbg=0 ctermfg=3
hi User3 ctermbg=0 ctermfg=4
hi User4 ctermbg=0 ctermfg=3

"""
"statusline
"""
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ 'right': [
      \            [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ],
      \            [ 'tags' ],
      \            ] },
      \ 'component_function': {
      \   'tags'        : 'gutentags#statusline',
      \   'gitbranch'   : 'fugitive#head',
      \   'filename'    : 'LightLineFilename',
      \   'fileformat'  : 'LightlineFileformat',
      \   'filetype'    : 'LightlineFiletype',
      \   'filencoding' : 'LightlineFileencoding',
      \   'mode'        : 'LightlineMode'
      \ },
      \ }


"Intersting info on getting filename
"Although expand('%') often works, there are rare occasions where it does not. But you can force Vim to always present the relative path by calling fnamemodify:

":echo fnamemodify(expand("%"), ":~:.")

"From the manual:

    ":.      Reduce file name to be relative to current directory, if
            "possible.  File name is unmodified if it is not below the
            "current directory.
            "For maximum shortness, use ":~:.".

"The :~ is optional. It will reduce the path relative to your home folder if possible (~/...). (Unfortunately that only works on your home; it won't turn /home/joey into ~joey.)

"If you are limited for space, and can manage with "fuzzy" information about where the file is located, then check out pathshorten() which compresses folder names down to one character:

":echo pathshorten('~/.vim/autoload/myfile.vim')
"~/.v/a/myfile.vim

"Reference: :h fnamem<Tab> and :h pathsh<Tab>
function! LightLineFilename()
  return fnamemodify(expand("%"), ":~:.")
endfunction
function! LightlineFileformat()
    return winwidth(0) > 90 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 90 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 90 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightlineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ winwidth(0) > 90 ? lightline#mode() : ''
endfunction
set laststatus=2
set noshowmode

" Autorefresh gutentags status
augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"set statusline=
"set statusline+=%1*[%n] " buffer number
"" set statusline+=%2*\ %{expand('%:~:h')}\  " file path
"set statusline+=%2*\ %{expand('%:p:h')}\  " file path
"set statusline+=%3*%t " file name
"set statusline+=%2*%m " file name
"" set statusline+=%=%{ObsessionStatus('Session','No-Session')}\ %{gutentags#statusline()}
"set statusline+=%=%4*[%l/%L]\
""set statusline+=%{gutentags#statusline()}

" fix backspace
set backspace=indent,eol,start


" highlight column 79
set colorcolumn=79

" search within visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

nnoremap <leader>r :redraw!<CR>
if !exists("autocommands_loaded")
   let autocommands_loaded = 1
   au FocusGained * :redraw!
   " Latex
   "au BufNewFile,BufRead *.tex set tw=79

   " Python indentation
   au BufNewFile,BufRead *.py call SetPythonOptions()
endif

"TagList
nnoremap <leader>t :TlistToggle<CR>

" TaskList (TODO)
nnoremap <leader>d <Plug>TaskList

function! s:DiffWithSaved()
   let filetype=&ft
   diffthis
   vnew | r # | normal! 1Gdd
   diffthis
   exe setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
       "\ | wincmd p | diffthis

" toggle paste mode with F12
set pastetoggle=<F12>

" use alt-] to open tag definition in new vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" new splits right and below
set splitright
set splitbelow

" navigate quickfix list
nnoremap cn <esc>:cn<CR>
nnoremap cp <esc>:cp<CR>

" whitespace
nnoremap <leader>w :StripWhitespace<CR>

" Strip whitespace on line
nnoremap <leader>wl V:StripWhitespace<CR>

vnoremap <leader>w :StripWhitespace<CR>

function! Obsession()
   let s:cwd = getcwd()
   let s:dir = $(dirname s:cwd)
   echo s:dir
endfunction

inoremap <C-u> <esc>viwUwi
nnoremap <C-u> viwUw

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

iabbrev @@ "richard.matthews@solacesystems.com"

vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>`>lll

inoremap jk <esc>

nnoremap <leader>vs :vs<CR>
nnoremap <leader>sp :sp<CR>

if executable('ag')
   " Use Ag over Grep
   set grepprg=ag\ --nogroup\ --nocolor

   "     " Use ag in CtrlP for listing files. Lightning fast and respects
   "     .gitignore
   let g:ctrlp_user_command = 'ag %s --path-to-ignore ~/.ag-ignore --ignore=*.[od] -l --nocolor -g ""'
   let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ag-ignore'
endif
nnoremap <leader>ag :Ack <cword><cr>

" ctrlp
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
" default to filename mode
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'et'

" FZF
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
  "\ 'bg':      ['bg', 'Normal'],
  "\ 'hl':      ['fg', 'Comment'],
  "\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  "\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  "\ 'hl+':     ['fg', 'Statement'],
  "\ 'info':    ['fg', 'PreProc'],
  "\ 'border':  ['fg', 'Ignore'],
  "\ 'prompt':  ['fg', 'Conditional'],
  "\ 'pointer': ['fg', 'Exception'],
  "\ 'marker':  ['fg', 'Keyword'],
  "\ 'spinner': ['fg', 'Label'],
  "\ 'header':  ['fg', 'Comment'] }
nnoremap <leader>p :Files<CR>
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
imap <c-x><c-f> <plug>(fzf-complete-file-ag)



" python compile errors look like:
" /opt/cvsdirs/rmatthews/SEMPv2P2-1/solcbr/common/commands/config/interface/interfaceCommands.py:35:
" error: xpath for attribute must be a tuple: member
set efm+=%f:%l:\ error:\ %m
" traceback errors
set efm+=\ \ File\ \"%f\,\ line\ %l\,\ in%.%#


" auto reload changed files from disk
set autoread


" vcscommand.vim
let VCSCommandMapPrefix = '<Leader>z'

" set the path to the current dir, and all its children
"let my_path=system('generate_vim_path.sh')
"let &path=my_path
"function! Update_Path()
   ""let my_path=system('generate_vim_path.sh')
   ""let &path=my_path
"endfunction
"nnoremap <leader>up :call Update_Path()<CR>

set path =.,,
set path+=**

"Completion
set completeopt=longest,menuone "insert longest common match, and always turn on menu
"let g:SuperTabDefaultCompletionType = "context"

" improve find
set wildmenu
set wildignorecase
set wildignore=*.o,*.bin,*.elf,*.obj
set wildmode=longest:full,full

" swtich to header file
nnoremap <leader>a :find %:t:r.


nnoremap <leader>zo :new<CR>:setlocal buftype=nofile<CR>:read !svn status<CR>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>ts :tab split<CR>

" diff all opened windows then close diffs
nnoremap <leader>md :windo diffthis<CR>
nnoremap <leader>mo :diffoff!<CR>
" to turn off all diffs, use :tabdo diffoff!

" diff just this buffer
nnoremap <leader>mc :diffthis<CR>

" only search for completion in current file, too slow otherwise
"set complete-=i

" CamelCaseMotion
call camelcasemotion#CreateMotionMappings('\')
"omap <silent> \iw <Plug>CamelCaseMotion_iw
"xmap <silent> \iw <Plug>CamelCaseMotion_iw


let g:ConqueGdb_Leader = '<leader>g'
function! ArmGDB()
   ""ConqueTermTab bash
   "ConqueGdbExe /Users/Richard/bin/arm/gcc-arm-none-eabi-5_2-2015q4/bin/arm-none-eabi-gdb
python << endpython
import vim
import os

cwd = os.path.basename(os.path.normpath(os.getcwd()))

bin_file = os.path.join('Bin',cwd,cwd+'.elf')

#command = 'ConqueGdbExe /Users/Richard/bin/arm/gcc-arm-none-eabi-5_2-2015q4/bin/arm-none-eabi-gdb'
#vim.command(command)

command = 'ConqueGdbTab --eval-command="target remote localhost:3333" --eval-command="monitor reset halt" --eval-command="monitor arm semihosting enable"' + ' ' + bin_file

vim.command(command)

vim.command("return 0")
endpython

endfunction

nnoremap <leader>tm :ConqueTermTab bash<CR>
command! Term ConqueTermTab bash

" BufExplorer
let g:bufExplorerFindActive=0

" doxygen syntax
let g:load_doxygen_syntax=1

" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['s']

"quick scope
nnoremap <leader>qst :QuickScopeToggle<CR>

"cvsedit for vim
function! Edit()
    execute( 'silent !chmod u+w %' )
    set noreadonly
endfunction
function! NoEdit()
    execute( 'silent !chmod u+w %' )
    set noreadonly
endfunction
nnoremap <leader>sw :call Edit()<CR>
"nnoremap <leader>sw :!chmod u+w %<CR><CR>:set noreadonly<CR>
nnoremap <leader>snw :call NoEdit()<CR>
"nnoremap <leader>snw :!chmod u-w %<CR><CR>:set readonly<CR>

"cscope in quickfix
nnoremap <leader>sq :set cscopequickfix=s-,c-,d-,i-,t-,e-<CR>
nnoremap <leader>snq :set cscopequickfix=<CR>

" cvsdiff
"nnoremap <leader>vd <Plug>Cvsdiffv

" vim completes me
"let g:vcm_direction = 'p'

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
nnoremap <leader>zo :Shell cvsrw<CR>

"
" Snippets
"

imap <C-s> <Plug>snipMateNextOrTrigger

" Highlight the current line, use :match to remove highlight
" alse sets mark l
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

set nocursorbind

" Better joining of comments
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif
" Use the system clipboard
set clipboard=unnamed

""
" Coc.nvim
""
let g:coc_global_extensions = [ 'coc-json', 'coc-python', 'coc-clangd' ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>KangarooPush<Plug>(coc-definition)
nmap <silent> gy <Plug>KangarooPush<Plug>(coc-type-definition)
nmap <silent> gi <Plug>KangarooPush<Plug>(coc-implementation)
nmap <silent> gr <Plug>KangarooPush<Plug>(coc-references)
nmap <silent> gb <Plug>KangarooPop

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Notes
" gf - jump to file under cursor and <C-^> or <C-6> to return to previous
" buffer
" use <C-w>f to open file under cursor in split
" use :tag file to jump to file, could potentially use <cword> to get word
" under cursor
