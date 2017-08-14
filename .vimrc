set nocompatible              " required
filetype off                  " required
"
" for installing vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'jpalardy/vim-slime'
"Bundle 'altercation/vim-colors-solarized'
Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'yonchu/accelerated-smooth-scroll'
"Bundle 'yuttie/comfortable-motion.vim'
Bundle 'terryma/vim-smooth-scroll'
"Bundle 'tpope/vim-surround'
Bundle 'easymotion/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Plugin 'rbong/vim-vertical'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'
" Make sure to call :PluginInstall in vim after changing the list


" For YouCompleteMe, you must install afterwards:
" cd ~/.vim/bundle/YouCompleteMe
" ./install.py --clang-completer
" or on ubuntu 16:
" python3 ./install.py --clang-completer

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " requiredenable syntax highlighting

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
"set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Ignore case for searches
set ignorecase
set smartcase

" reset normal effect of backspace
set backspace=indent,eol,start

" shortcut for inserting only one character
nnoremap èa a_<Esc>:call SetCursorLineNrColorReplace()<CR>r
nnoremap èi i_<Esc>:call SetCursorLineNrColorReplace()<CR>r
nnoremap èA A_<Esc>:call SetCursorLineNrColorReplace()<CR>r
nnoremap èI I_<Esc>:call SetCursorLineNrColorReplace()<CR>r

" capitalize first letter word
nnoremap àc m`b~``

set expandtab
set tabstop=4
set shiftwidth=4
map <F2> :retab <CR> :wq! <CR>

"Remap change split screen
"noremap <C-T> W<C-T>
"nnoremap <C-S> W<C-S>
"nnoremap <C-R> W<C-R>
"nnoremap <C-C> W<C-C>

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
noremap à0 0
noremap à$ $
nnoremap àp '[V']
vnoremap ié iw
vnoremap iÉ iW
vnoremap aé aw
vnoremap aÉ aW
nnoremap ié iw
nnoremap iÉ iW
nnoremap aé aw
nnoremap aÉ aW
noremap ( [
noremap ) ]
noremap [ (
noremap ] ]

" change tabs
noremap às gt
noremap àt gT

" syntastic
set laststatus=2
let g:syntastic_python_checkers = ['pylint']
" SyntasticToggleMode "Disable syntastic
" make sure pylint is installed in the virtualenv you use!


" configuration for nerdtree
" active tree shortcut
map <C-n> :NERDTreeToggle<CR>
" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']


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




" Make UltiSnips compatible with YouCompleteMe
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction


" Configurations for autocomplete bundle
" only for specific files
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
" autoclose and go to definition
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" do not forget to have leader defined
"let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_goto_buffer_command = 'new-tab'
noremap èo :YcmCompleter GoTo<CR>
noremap èé :YcmCompleter GoToReferences<CR>


" slime for sending code to ipython
let g:slime_python_ipython = 1 "delete -q in ftplugin/python/slime.vim
let g:slime_target = "tmux"
let g:slimux_select_from_current_window = 1
let g:slime_no_mappings = 1
vmap èy <Plug>SlimeRegionSend
nmap èy <Plug>SlimeLineSend
nmap èY <Plug>SlimeConfig|<Plug>SlimeLineSend
vmap èY <Plug>SlimeConfig|<Plug>SlimeRegionSend

" for restarting ipython on left panel:
" (silent execution requires redrawing afterwards)
command IPyRestart silent execute "!byobu-tmux send-keys -t right 'exit' enter C-l && byobu-tmux send-keys -t right 'ipython' enter C-l" | execute ':redraw!'
map <F10> :IPyRestart<CR>

" CtrlP for opening files easily
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
" use ctrl+t to open in a new tab


" fast and smooth movements
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
map <C-R> zL
map <C-C> zH

" change redo to U
noremap U <C-R>
noremap ù U

"" ZSH like menu
"" When you type the first tab, it will complete as much as possible,
"" the second tab hit will provide a list, the third
"" and subsequent tabs will cycle through completion options
"" so you can complete the file without further keys
"set wildmode=longest,list,full
"" Sweet zsh-like autocompletion menu
"set wildmenu

" vertically look for non-empty character
" map <leader>j :Vertical f<CR>
" map <leader>k :Vertical b<CR>
noremap <silent> <c-t> :Vertical f<CR>
noremap <silent> <c-s> :Vertical b<CR>
" require 'stty -ixon' in the .bashrc

" set paste mode
set pastetoggle=<F12>

" shortcut for changing tab
nnoremap [1;5C gt
nnoremap [1;5D gT
nnoremap <C-Right> gt
nnoremap <C-Left> gT

map w <Plug>(easymotion-prefix)
nmap wj <Plug>(easymotion-t)
nmap wJ <Plug>(easymotion-T)
nmap wé <Plug>(easymotion-w)
nmap wÉ <Plug>(easymotion-W)
nmap wàe <Plug>(easymotion-ge)
nmap wàE <Plug>(easymotion-gE)
nmap wt <Plug>(easymotion-j)
nmap ws <Plug>(easymotion-w)
nmap wr <Plug>(easymotion-sn)
nmap wy <Plug>(easymotion-bd-t)
nmap ww <Plug>(easymotion-bd-f)
nmap wx <Plug>(easymotion-bd-n)
nmap w* <Plug>(easymotion-next)
nmap w# <Plug>(easymotion-prev)
nmap wn <Plug>(easymotion-bd-n)
nmap w. <Plug>(easymotion-repeat)

noremap k ge
noremap K gE

nnoremap àv gv
nnoremap zt zt

" delete without copy
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap èd d
vnoremap èd d
nnoremap èD D
vnoremap èD D
noremap l "_c
noremap L "_C
noremap èl c
noremap èL C
nnoremap x "_x
nnoremap èx x

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

" python go to beginning/end of block
nmap (b    ^c<C-s>^é
nmap )b    ^c<C-t>^

" to do the couple of curly brackets automatically
inoremap {<CR> {<CR>}<Esc>ko

" history
nnoremap è, :<C-f>
nnoremap è/ /<C-f>
noremap <C-q> <C-c><C-c>

" highlight unwanted spaces
highlight UnwantedSpaces ctermbg=red ctermfg=white
call matchadd('UnwantedSpaces', ' \| ', 51)
highlight TrailingSpaces ctermbg=green
call matchadd('TrailingSpaces', '\s\+$', 52)

" highlight line too long (120 char)
highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
call matchadd('OverLength', '\%121v.\+', 53)

"inoremap <expr> <S-Tab>     pumvisible() ? '\<C-P>' : '\<C-V><S-Tab>'


" Colorize line numbers in insert and visual modes
" ------------------------------------------------
function! SetCursorLineNrColorInsert(mode)
    " Insert mode: white
    if a:mode == "i"
        highlight CursorLineNr ctermfg=9
        highlight LineNr ctermfg=9
    " Replace mode: red
    elseif a:mode == "r"
        highlight CursorLineNr ctermfg=1
        highlight LineNr ctermfg=1
    endif
endfunction

function! SetCursorLineNrColorVisual()
    set updatetime=0
    " Visual mode: green
    highlight CursorLineNr cterm=none ctermfg=2
    highlight LineNr cterm=none ctermfg=2
endfunction

function! SetCursorLineNrColorReplace()
    set updatetime=0
    " Replace mode: red
    highlight CursorLineNr cterm=none ctermfg=1
    highlight LineNr cterm=none ctermfg=1
endfunction

function! SetCursorLineNrColorScript()
    set updatetime=0
    " script mode: blue
    highlight CursorLineNr cterm=none ctermfg=4
    highlight LineNr cterm=none ctermfg=4
endfunction

function! ResetCursorLineNrColor()
    set updatetime=4000
    highlight CursorLineNr cterm=none ctermfg=3
    highlight LineNr cterm=none ctermfg=3
endfunction

"silent !p=$(setxkbmap -query | grep variant | sed 's/variant: *\(.*\)[^\s]*,/\1/')
"let p = $p
"echo p

" vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
nnoremap <silent> v :call SetCursorLineNrColorVisual()<CR>v
nnoremap <silent> V :call SetCursorLineNrColorVisual()<CR>V
nnoremap <silent> <C-v> :call SetCursorLineNrColorVisual()<CR><C-v>
nnoremap <silent> g :call SetCursorLineNrColorReplace()<CR>r
nnoremap , :call SetCursorLineNrColorScript()<CR>:
nnoremap / :call SetCursorLineNrColorScript()<CR>/

augroup CursorLineNrColorSwap
    autocmd!
    autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
    autocmd InsertLeave * call ResetCursorLineNrColor()
    autocmd CursorHold * call ResetCursorLineNrColor()

    au BufNewFile,BufRead *.tpp
        \ set filetype=cpp

    au BufNewFile,BufRead *.h,*.c,*.cc,*.tpp
        \ set noexpandtab |
        \ set tabstop=8 |
        \ set shiftwidth=8 |
        \ silent SyntasticToggleMode |
        \ set list lcs=tab:\|\ 
        "\ let g:ycm_global_ycm_extra_conf = '/home/guillaumeburger/.vim/bundle/YouCompleteMe/python/ycm/.ycm_extra_conf.py' |

    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix |
        \ set comments+=:# |
        \ set formatoptions+=ro |
        " \ set nowrap |

    " ignore tree if it is the last left
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " caps lock as esc
    " au VimEnter * silent !sh ~/.xmodmap.launcher
augroup END
