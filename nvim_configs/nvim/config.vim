" ZSH like menu
" When you type the first tab, it will complete as much as possible,
" the second tab hit will provide a list, the third
" and subsequent tabs will cycle through completion options
" so you can complete the file without further keys
set wildmode=longest,list,full
" Sweet zsh-like autocompletion menu
set wildmenu

" show line numbers
set relativenumber
map èn :set relativenumber!<CR>
set number

" mouse doesn't select line numbers
set mouse=a

" line width
set textwidth=120
set formatoptions=roq

" indent and fold config
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set foldlevel=50
set foldmethod=syntax

" Ignore case for searches
set ignorecase
set smartcase

" Wrapping
let breakindentopt = 'sbr'
let &showbreak = ' ↳ '
set breakindent

" get the differences since last saved
com! Diffs w !diff % - 

"print as PDF file
com!  PDF hardcopy > toPrint.pdf
