"
" Richard Matthews
" December 18, 2017
"

set nocompatible              " be iMproved, required

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:vimspector_enable_mappings = 'HUMAN'

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'puremourning/vimspector'

Plug 'seeamkhan/robotframework-vim'

Plug 'overcache/NeoSolarized'
Plug 'altercation/vim-colors-solarized'

"Plug 'tmhedberg/SimpylFold'

"Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree'

Plug 'ludovicchabant/vim-gutentags'

Plug 'scrooloose/nerdcommenter'

" Tag bar functionallity
" Old
"Plug 'vim-scripts/taglist.vim'
" More recent
Plug 'majutsushi/tagbar'
" LSP support
"Plug 'liuchengxu/vista.vim'

"Plug 'vim-scripts/TaskList.vim'

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
" Depends on fugitive
Plug 'idanarye/vim-merginal'

"Plug 'vim-scripts/Conque-GDB'

"Plug 'ajh17/VimCompletesMe'

"Plug 'octref/RootIgnore'

"Plug 'djmoch/vim-makejob'

"Plug 'tpope/vim-dispatch'

Plug 'itchyny/lightline.vim'

"Plug 'Shougo/vimproc.vim', {'do' : 'make'}


Plug 'tpope/vim-sleuth'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'tommcdo/vim-kangaroo'

"Plug 'vim-scripts/cvsdiff.vim'

""https://github.com/vim-scripts/DoxygenToolkit.vim
Plug 'mrtazz/DoxygenToolkit.vim'

" VIM LSP Client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" C/C++ LSP syntax highlighting
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Python formatting
Plug 'Vimjas/vim-python-pep8-indent'

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'


"Plug 'alessandroyorba/despacio' alternate color scheme

"Plug 'arnar/vim-matchopen'
"Plug 'vim-scripts/Highlight-UnMatched-Brackets'

"Plug 'ervandew/supertab'

" Plug 'vim-scripts/cscope.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'martinda/Jenkinsfile-vim-syntax'

Plug 'rhysd/vim-clang-format'

" Codeium AI Assistant
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

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

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

func! SetSyntax()
  syntax enable

  if has("gui_running")
    if has("gui_macvim")
      colorscheme NeoSolarized
    else
      colorscheme solarized
    endif
  else
    colorscheme solarized
  endif

  " LSP CXX Highlight
  hi LspCxxHlGroupMemberVariable ctermfg=Magenta guifg=#d33682


  if has("gui_running")
    if (v:os_appearance == 1)
      set background=dark
    else
      set background=light
    endif
  else
    set background=light
  endif

  "let iterm_profile = $ITERM_PROFILE

  "if iterm_profile == "Dark"
  "set background=dark
  "else
  "set background=light
  "endif

  set guifont=FiraMono\ Nerd\ Font\ Mono:h16

  if has("gui_macvim")
    " I make vertSplitBar a transparent background color. If you like the origin
    " solarized vertSplitBar style more, set this value to 0.
    let g:neosolarized_vertSplitBgTrans = 0

    " Default value is "normal", Setting this option to "high" or "low" does use the
    " same Solarized palette but simply shifts some values up or down in order to
    " expand or compress the tonal range displayed.
    let g:neosolarized_contrast = "normal"

    " Special characters such as trailing whitespace, tabs, newlines, when displayed
    " using ":set list" can be set to one of three levels depending on your needs.
    " Default value is "normal". Provide "high" and "low" options.
    let g:neosolarized_visibility = "normal"

    " If you wish to enable/disable NeoSolarized from displaying bold, underlined
    " or italicized" typefaces, simply assign 1 or 0 to the appropriate variable.
    " Default values:
    let g:neosolarized_bold = 1
    let g:neosolarized_underline = 1
    let g:neosolarized_italic = 1

    " Used to enable/disable "bold as bright" in Neovim terminal. If colors of bold
    " text output by commands like `ls` aren't what you expect, you might want to
    " try disabling this option. Default value:
    let g:neosolarized_termBoldAsBright = 1
  else
    let g:solarized_termtrans = 1
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    let g:solarized_menu=1
  endif
endfunc

func! ChangeBackground()
  if (v:os_appearance == 1)
    set background=dark
    let g:lightline.colorscheme = 'wombat'
  else
    set background=light
    let g:lightline.colorscheme = 'solarized'
  endif
  redraw!
  call LightlineReload()
endfunc

if has("gui_running")
  au OSAppearanceChanged * call ChangeBackground()
endif

if !exists('set_syntax')
  call SetSyntax()
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

"
" File autocmds
"
augroup FileAutoCommandsGroup
    autocmd!
    " Latex
    autocmd BufNewFile,BufRead *.tex set spell
    " Makefile indentation
    autocmd BufNewFile,BufRead Makefile,*.mk call SetMakefileOptions()
    " Python indentation
    autocmd BufNewFile,BufRead *.py call SetPythonOptions()
augroup end

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


function! SetMakefileOptions()
  let b:sleuth_automatic = 0
  set list
  set listchars=tab:␉·
  set noexpandtab
  set shiftwidth=4
  set smarttab
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

" Splits
"
" resize
"nnoremap <leader>- :resize -5<CR>
"nnoremap <leader>= :resize +5<CR>
nnoremap <leader>, :vertical resize -5<CR>
nnoremap <leader>. :vertical resize +5<CR>
nnoremap <leader>= <C-W>=

" new splits right and below
set splitright
set splitbelow

" Equalize splits on create
set equalalways

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
    return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightlineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ winwidth(0) > 50 ? lightline#mode() : ''
endfunction
set laststatus=2
set noshowmode

" Autorefresh gutentags status
augroup LightlineUpdateAutocmds
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup END

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
   autocmd FocusGained * :redraw!
endif

"TagList/Tagbar/Vista
"TagList
"nnoremap <leader>t :TlistToggle<CR>
" Vista
"nnoremap <leader>t :Vista coc<CR>
"nnoremap <leader>t :Vista!!<CR>
"let g:vista_sidebard_position="vertical topleft"
"let g:vista_stay_on_open=0
"let g:vista_default_executive="coc"
" Tagbar
nnoremap <leader>t :TagbarToggle<CR>
let g:tagbar_sort = 0


" TaskList (TODO)
"nnoremap <leader>d <Plug>TaskList

function! s:DiffWithSaved()
   let filetype=&ft
   diffthis
   vnew | r # | normal! 1Gdd
   diffthis
   exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
       "\ | wincmd p | diffthis

" toggle paste mode with F12
set pastetoggle=<F12>

" use alt-] to open tag definition in new vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" navigate quickfix list
nnoremap cn <esc>:cn<CR>
nnoremap cp <esc>:cp<CR>

" navigate location list
" Can't use l as this slows down using l to move cursor
" come up with another mapping
"nnoremap ln <esc>:lnext<CR>
"nnoremap lp <esc>:lprevious<CR>

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

   let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ag-ignore'
   let $FZF_DEFAULT_COMMAND = 'ag --path-to-ignore ~/.ag-ignore -g ""'
endif
nnoremap <leader>ag :Ack <cword><cr>

" ctrlp
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
" default to filename mode
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'et'

" FZF
" Customize fzf colors to match your color scheme
let g:fzf_colors = {}
"let g:fzf_colors = {
            "\ 'fg': ['fg', 'Normal', 'Comment', 'CursorLine'],
            "\ }
"let g:fzf_colors =
"\ { 'fg':      ['fg', '#af005f', 'Magenta'],
  "\ 'bg':      ['bg', 'Magenta'],
  "\ 'hl':      ['fg', 'Normal'],
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
nnoremap <leader>p :Files<cr>
nnoremap <leader>g :GFiles --cached --others --exclude-standard<cr>
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
"nnoremap <leader>a :find %:t:r.
nnoremap <leader>j :CocCommand clangd.switchSourceHeader<CR>

"function! GetHeaderSourceFile()
    "let cur_file = expand('%:t:r')
    "let cur_file_extension = expand('%:e')
    "let cur_dir = getcwd()
"python3 << endpython
"import vim
"import subprocess

"header_extensions = ['hpp', 'h']
"source_extensions = ['c', 'cpp']

"curFileExtension = vim.eval('cur_file_extension')

"if curFileExtension in source_extensions:
    "extensions = header_extensions
"else:
    "extensions = source_extensions

"cwd = vim.eval('cur_dir')
"file = vim.eval('cur_file')

"found = False

"for extension in extensions:
    "command = ['find', '{cwd}'.format(cwd=cwd),
    "'-name',
    "'{file}.{extension}'.format( file=file, extension=extension)
    "]
    "print(command)
    "try:
        "output = subprocess.check_output(command, shell=False, universal_newlines=True)
        "foundFile = output.partition('\n')[0]
        "foundFile = foundFile.rstrip()
    "except subprocess.CalledProcessError as e:
        "print(e.output)
        "continue
    "if not foundFile:
        "print("Found no file")
        "continue
    "else:
        "print("Found {}".format(foundFile))
        "found = True
        "vim.command('let header_source_file = "{}"'.format(foundFile))
        "break

"if not found:
    "vim.command('let header_source_file = ""')
"endpython

    "if header_source_file == ""
        "echoerr "Couldn't find file"
        "return expand('%')
    "else
        "return header_source_file
    "endif
"endfunction


nnoremap <leader>zo :new<CR>:setlocal buftype=nofile<CR>:read !svn status<CR>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>ts :tab split<CR>
nnoremap <leader>tc :tabclose<CR>

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
" Coc.nvim uses <C-j> instead
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
"
" NB: for rust, may need to run this command for it to work: `rustup component add rust-src`
""
let g:coc_global_extensions = [ 'coc-json', 'coc-python', 'coc-clangd', 'coc-rust-analyzer' ]

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

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
  "inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
  "inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
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
nmap          gf <Plug>KangarooPush:e <cfile><CR>

" Not through Coc.nvim
nmap gp <Plug>KangarooPush*:edit <C-R>=GetHeaderSourceFile()<CR><CR>n:noh<CR>zz

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <leader>d :CocDiagnostics<CR>

augroup MyCocAutoCmdGroup
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
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

set undodir=~/.vim/undodir

set spell

set belloff=all

" LSP CXX Highlight
hi LspCxxHlGroupMemberVariable ctermfg=Magenta guifg=#d33682

set makeprg=/Users/richardmatthews/bin/make-strip-xcode-warning

"
" Codeium
"
let g:codeium_disable_bindings = 1

imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <script><silent><nowait><expr> <C-w> codeium#AcceptNextWord()
imap <script><silent><nowait><expr> <C-l> codeium#AcceptNextLine()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-c>   <Cmd>call codeium#Clear()<CR>

" Notes
" gf - jump to file under cursor and <C-^> or <C-6> to return to previous
" buffer
" use <C-w>f to open file under cursor in split
" use :tag file to jump to file, could potentially use <cword> to get word
" under cursor
