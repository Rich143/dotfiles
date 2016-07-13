set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'

Plugin 'tmhedberg/SimpylFold'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'scrooloose/nerdtree'

Plugin 'ludovicchabant/vim-gutentags'

Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-scripts/taglist.vim'

Plugin 'vim-scripts/TaskList.vim'

Plugin 'unblevable/quick-scope'

Plugin 'wellle/targets.vim'

Plugin 'ntpeters/vim-better-whitespace'

Plugin 'tpope/vim-obsession'

"Plugin 'vim-ctrlspace/vim-ctrlspace'

Plugin 'chrisbra/Recover.vim'

Plugin 'rking/ag.vim'

Plugin 'Chun-Yang/vim-action-ag'

Plugin 'yssl/QFEnter'

Plugin 'Yggdroot/indentLine'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'jlanzarotta/bufexplorer'

Plugin 'vcscommand.vim'

Plugin 'tpope/vim-surround'

Plugin 'bkad/CamelCaseMotion'

"Plugin 'arnar/vim-matchopen'
"Plugin 'vim-scripts/Highlight-UnMatched-Brackets'

"Plugin 'ervandew/supertab'

" Plugin 'vim-scripts/cscope.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Ctrl-space
set hidden " required

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
    colorscheme solarized

    set t_Co=256
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"

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
" set foldmethod=indent
" set foldlevel=99

" nnoremap <space> za

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

"Completion
set completeopt=longest,menuone "insert longest common match, and always turn on menu
let g:SuperTabDefaultCompletionType = "context"

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

"guten-tags
let g:gutentags_project_root=['.svn']


" resize
nnoremap <leader>- :resize -5<CR>
nnoremap <leader>= :resize +5<CR>
nnoremap <leader>, :vertical resize -5<CR>
nnoremap <leader>. :vertical resize +5<CR>

hi User1 ctermbg=0 ctermfg=3
hi User2 ctermbg=0 ctermfg=3
hi User3 ctermbg=0 ctermfg=4
hi User4 ctermbg=0 ctermfg=3

"statusline
set laststatus=2
set statusline=
set statusline+=%1*[%n] " buffer number
" set statusline+=%2*\ %{expand('%:~:h')}\  " file path
set statusline+=%2*\ %{expand('%:p:h')}\  " file path
set statusline+=%3*%t " file name
set statusline+=%2*%m " file name
" set statusline+=%=%{ObsessionStatus('Session','No-Session')}\ %{gutentags#statusline()}
set statusline+=%=%4*[%l/%L]\ 
set statusline+=%{gutentags#statusline()}

" fix backspace
set backspace=indent,eol,start


" highlight column 79
set cc=79

" search within visual selection
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

nnoremap <leader>r :redraw!<CR>

"TagList
nnoremap <leader>t :TlistToggle<CR>

" TaskList (TODO)
nnoremap <leader>d :TaskList<CR>
let g:tlTokenList = ['TODO:']

"function! s:DiffWithSaved()
    "let filetype=&ft
    "diffthis
    "vnew | r # | normal! 1Gdd
    "diffthis
    "exe setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
"endfunction
"com! DiffSaved call s:DiffWithSaved()

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis

" toggle paste mode with F2
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
    let g:ctrlp_user_command = 'ag %s --ignore=*.[od] -l --nocolor -g ""'
endif


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
set path=.,,**

" improve find
set wildmenu
" set wildignore+=*.min*
set wildignorecase
set wildmode=longest:full,full

nnoremap <leader>zo :new<CR>:setlocal buftype=nofile<CR>:read !svn status<CR>

nnoremap <leader>tn :tabnew<CR>

" diff all opened windows then close diffs
nnoremap <leader>md :windo diffthis<CR>
nnoremap <leader>mo :diffoff!<CR>
" to turn off all diffs, use :tabdo diffoff!

" diff just this buffer
nnoremap <leader>mc :diffthis<CR>

" only search for completion in current file, too slow otherwise
set complete-=i

" CamelCaseMotion
call camelcasemotion#CreateMotionMappings('\')
"omap <silent> \iw <Plug>CamelCaseMotion_iw
"xmap <silent> \iw <Plug>CamelCaseMotion_iw

" ctrlp
" default to filename mode
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'et'

" Notes
" gf - jump to file under cursor and <C-^> or <C-6> to return to previous
" buffer
" use <C-w>f to open file under cursor in split
" use :tag file to jump to file, could potentially use <cword> to get word
" under cursor
