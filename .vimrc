set nocompatible              " required
filetype off                  " required


source ~/.vimrc.plug
source ~/.vimrc.bepo

"Standard configuration

syntax enable

let mapleader=" "

" encoding
set encoding=utf-8

" show line numbers
set relativenumber
set number
" show in bottom-right-hand corner number of line and column
set ruler
" mouse doesn't select line numbers
set mouse=a

" show commands
set showcmd

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Ignore case for searches
set ignorecase
set smartcase

" reset normal effect of backspace
set backspace=indent,eol,start

" shortcut for easy buffer switching
nnoremap <silent> ç :call SetCursorLineNrColorScript()<CR>:ls<CR>:b 

" shortcut for inserting only one character
nnoremap èa a_<Esc>:call SetCursorLineNrColorReplace()<CR>r
nnoremap èi i_<Esc>:call SetCursorLineNrColorReplace()<CR>r
nnoremap èA A_<Esc>:call SetCursorLineNrColorReplace()<CR>r
nnoremap èI I_<Esc>:call SetCursorLineNrColorReplace()<CR>r

" capitalize first letter word
nnoremap gc m`b~``

" open splits in a more logical way
set splitbelow
set splitright

set expandtab
set tabstop=4
set shiftwidth=4
map <F2> :retab <CR> :wq! <CR>

"Remap change split screen
"noremap <C-T> W<C-T>
"nnoremap <C-S> W<C-S>
"nnoremap <C-R> W<C-R>
"nnoremap <C-C> W<C-C>

nnoremap zé zMzr

set linebreak
let breakindentopt = 'sbr'
let &showbreak = ' ↳ '
set breakindent
noremap t gj
noremap <Down> gj
noremap s gk
noremap <Up> gk
noremap 0 g0
noremap $ g$
noremap T j
noremap S k
noremap g0 0
noremap g$ $
nnoremap gp '[V']
"vnoremap ié iw
"vnoremap iÉ iW
"vnoremap aé aw
"vnoremap aÉ aW
"nnoremap ié iw
"nnoremap iÉ iW
"nnoremap aé aw
"nnoremap aÉ aW
noremap ( [
noremap ) ]
noremap [ (
noremap ] ]

" change tabs
noremap gs gt
noremap gt gT



" clipboard from extern applications
set clipboard=unnamed


" for Jérémy
vnoremap y y']
vnoremap Y y

" get the differences since last saved
com! Diffs w !diff % - 


"print as PDF file
com!  PDF hardcopy > toPrint.pdf

"python with virtualenv support
"py3 << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  exec(open(activate_this).read(), dict(__file__=activate_this))
"EOF



" for restarting ipython on left panel:
" (silent execution requires redrawing afterwards)
command IPyRestart silent execute "!byobu-tmux send-keys -t right 'exit' enter C-l && byobu-tmux send-keys -t right 'ipython' enter C-l" | execute ':redraw!'
map <F10> :IPyRestart<CR>

map <C-R> zL
map <C-C> zH

" change redo to U
noremap U <C-R>
noremap ù U

" ZSH like menu
" When you type the first tab, it will complete as much as possible,
" the second tab hit will provide a list, the third
" and subsequent tabs will cycle through completion options
" so you can complete the file without further keys
set wildmode=longest,list,full
" Sweet zsh-like autocompletion menu
set wildmenu


" set paste mode
set pastetoggle=<F12>

" shortcut for changing tab
nnoremap [1;5C gt
nnoremap [1;5D gT
nnoremap <C-Right> gt
nnoremap <C-Left> gT


noremap ê ge
noremap ê gE

"nnoremap àv gv
nnoremap zt zt

" delete without copy
nnoremap d "_d
nnoremap dd "_dd
vnoremap d "_d
vnoremap dd "_dd
nnoremap D "_D
vnoremap D "_D
nnoremap èd d
nnoremap èdd dd
vnoremap èd d
vnoremap èdd dd
nnoremap èD D
vnoremap èD D
noremap l "_c
noremap L "_C
noremap ll "_cc
noremap èl c
noremap èL C
noremap èll cc
nnoremap x "_x
nnoremap èx x
nnoremap dl "_cc<ESC>

nnoremap Y y$

" comment and uncomment
noremap è# :s.^\(\s*\)\(\S\).\1# \2.g<CR>
":s/^/# /g<CR>
noremap èc :s.^\(\s*\)\(\S\).\1\/\/ \2.g<CR>
" :s/^/\/\/ /g<CR>
noremap èu :s.^\(\s*\)# .\1.g<CR>
noremap èC :s.^\(\s*\)\/\/ .\1.g<CR>
" :s/^# g<CR>:s/^\/\/ //g<CR>

" indent
nnoremap < <<
nnoremap > >>
vnoremap è> >gv
vnoremap è< <gv

" python go to beginning/end of block
nmap (b    ^c<C-s>^é
nmap )b    ^c<C-t>^

" to do the couple of curly brackets automatically
inoremap {<CR> {<CR>}<Esc>ko

" history
nnoremap è, :<C-f>
nnoremap è/ /<C-f>
noremap <C-q> <C-c><C-c>



"inoremap <expr> <S-Tab>     pumvisible() ? '\<C-P>' : '\<C-V><S-Tab>'



source ~/.vimrc.color


augroup TypeDependentSettings
    au BufNewFile,BufRead *.tpp
        \ set filetype=cpp

    au BufNewFile,BufRead *.h,*.c,*.cc,*.tpp
        \ set noexpandtab |
        \ set tabstop=8 |
        \ set shiftwidth=8 |
        \ set foldmethod=syntax |
        \ set foldlevel=50 |
        \ set list lcs=tab:\|\ 
        "\ set list lcs=tab:\|\ 
        "\ let g:ycm_global_ycm_extra_conf = '/home/guillaumeburger/.vim/bundle/YouCompleteMe/python/ycm/.ycm_extra_conf.py' |
        "\ silent SyntasticToggleMode |

    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix |
        \ set comments+=:# |
        \ set formatoptions+=ro |
        \ set foldmethod=indent |
        \ set foldlevel=50 |
        " \ set nowrap |

    " ignore tree if it is the last left
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " caps lock as esc
    " au VimEnter * silent !sh ~/.xmodmap.launcher
augroup END
