""""""""""""""""""""""""""""""""""""""""""""""""""
" Deleting, copying and pasting
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap d "_d
nnoremap dd "_dd
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
nnoremap èd d
nnoremap èdd dd
vnoremap èd d
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
vnoremap p "_dP

nnoremap Y y$

noremap <silent> èpp :set paste<CR>
noremap <silent> èpn :set nopaste<CR>
noremap èP :tabe %<CR><C-\><C-n>:set signcolumn=no<CR>:set nonumber<CR>:set norelativenumber<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo and Redo
""""""""""""""""""""""""""""""""""""""""""""""""""
noremap U <C-R>
noremap ù U

""""""""""""""""""""""""""""""""""""""""""""""""""
" Movements
""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ê ge
noremap Ê gE

" easy motions with wrappings
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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap < <<
nnoremap > >>
vnoremap è> >gv
vnoremap è< <gv

""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast insert
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap èa a_<Esc>r
nnoremap èi i_<Esc>r

""""""""""""""""""""""""""""""""""""""""""""""""""
" Autowrapping with par
""""""""""""""""""""""""""""""""""""""""""""""""""
" h1 means the first line has a different syntax
" T8 means that tabs are considered as 8 spaces
set formatprg=par\ 100T8h0

set textwidth=120
set formatoptions=roq

function! s:formatWrap(width)
    let col=virtcol('.') - 1
    execute "set formatprg=par\\ " . a:width . "T8p" . col
endfunction

function! s:formatCppHeaderWrap(width)
    execute "normal! ^"
    let col_start_comment = virtcol('.') - 1
    execute "normal! /\\t\<cr>l"
    let col_start_text = virtcol('.') - 1
    let number_tabs = float2nr(ceil((col_start_text - col_start_comment) / 8))
    execute "set formatprg=par\\ " . a:width . "T8p" . col_start_text
    execute "normal! $"
    if virtcol('.') > a:width
        execute "normal! 0" . a:width . "|F "
        execute "normal! i\<cr>/\<esc>"
        execute "normal! " . number_tabs . "a\<tab>\<esc>"
        " execute "normal! Vgq"
        echo a:width
    endif
endfunction
" Wrapping for comments (ignore the first commenting sign)
nnoremap <script> èqq ^W:call <SID>formatWrap(120)<CR>gqq
" Wrapping with repetition previous columns
nnoremap <script> èQQ :call <SID>formatWrap(120)<CR>gqq
vnoremap <script> èqq <Esc>:call <SID>formatWrap(120)<CR>gvgq
" Wrapping for comments with tabs (par replaces tabs with 8 spaces)
nnoremap <script> èqt ^W:call <SID>formatWrap(120)<CR>gqq:'[,']s. \{2,8}.\t.g<CR>
" Wrapping with répétion previous columns with tabs
nnoremap <script> èQT :call <SID>formatWrap(120)<CR>gqq:'[,']s. \{2,8}.\t.g<CR>
vnoremap <script> èqt <Esc>:call <SID>formatWrap(120)<CR>gvgq:'[,']s. \{2,8}.\t.g<CR>
" Wrapping with header (first line diffent from others
nnoremap <script> èqh :call <SID>formatCppHeaderWrap(100)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Cpp miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""
" to do the couple of curly brackets automatically
inoremap {<CR> {<CR>}<Esc>ko

function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cc")
    find **/%:t:r.h
  else
    find **/%:t:r.cc
  endif
endfunction

nmap ès :call SwitchSourceHeader()<CR>
