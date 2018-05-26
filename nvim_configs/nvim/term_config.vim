" Terminal escape sequence.
tnoremap <Esc> <C-\><C-n>

" Enter in insert mode terminal
augroup TerminalInsert
    au!
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window and tab management identical to byobu window and panes.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitright
set splitbelow
set diffopt+=vertical
" movements
nnoremap <M-c> <C-W>h
nnoremap <M-t> <C-W>j
nnoremap <M-s> <C-W>k
nnoremap <M-r> <C-W>l
nnoremap <M-d> gt
nnoremap <M-v> gT
tnoremap <M-c> <C-\><C-n><C-W>h
tnoremap <M-t> <C-\><C-n><C-W>j
tnoremap <M-s> <C-\><C-n><C-W>k
tnoremap <M-r> <C-\><C-n><C-W>l
tnoremap <M-d> <C-\><C-n>gt
tnoremap <M-v> <C-\><C-n>gT
inoremap <M-c> <Esc><C-W>h
inoremap <M-t> <Esc><C-W>j
inoremap <M-s> <Esc><C-W>k
inoremap <M-r> <Esc><C-W>l
inoremap <M-d> <Esc>gt
inoremap <M-v> <Esc>gT
xnoremap <M-c> <Esc><C-W>h
xnoremap <M-t> <Esc><C-W>j
xnoremap <M-s> <Esc><C-W>k
xnoremap <M-r> <Esc><C-W>l
xnoremap <M-d> <Esc>gt
xnoremap <M-v> <Esc>gT
" normal splits
nnoremap <silent> <M-n><M-l>  :tabnew<CR>
nnoremap <silent> <M-n><M-r>  :vsplit<CR>:enew<CR>
nnoremap <silent> <M-n><M-c>  :vsplit<CR><C-w>h:enew<CR>
nnoremap <silent> <M-n><M-t>  :split<CR>:enew<CR>
nnoremap <silent> <M-n><M-s>  :split<CR><C-w>k:enew<CR>
tnoremap <silent> <M-n><M-l>  <C-\><C-n>:tabnew<CR>
tnoremap <silent> <M-n><M-r>  <C-\><C-n>:vsplit<CR>:enew<CR>
tnoremap <silent> <M-n><M-c>  <C-\><C-n>:vsplit<CR><C-w>h:enew<CR>
tnoremap <silent> <M-n><M-t>  <C-\><C-n>:split<CR>:enew<CR>
tnoremap <silent> <M-n><M-s>  <C-\><C-n>:split<CR><C-w>k:enew<CR>
inoremap <silent> <M-n><M-l>  <Esc>:tabnew<CR>
inoremap <silent> <M-n><M-r>  <Esc>:vsplit<CR>:enew<CR>
inoremap <silent> <M-n><M-c>  <Esc>:vsplit<CR><C-w>h:enew<CR>
inoremap <silent> <M-n><M-t>  <Esc>:split<CR>:enew<CR>
inoremap <silent> <M-n><M-s>  <Esc>:split<CR><C-w>k:enew<CR>
xnoremap <silent> <M-n><M-l>  <Esc>:tabnew<CR>
xnoremap <silent> <M-n><M-r>  <Esc>:vsplit<CR>:enew<CR>
xnoremap <silent> <M-n><M-c>  <Esc>:vsplit<CR><C-w>h:enew<CR>
xnoremap <silent> <M-n><M-t>  <Esc>:split<CR>:enew<CR>
xnoremap <silent> <M-n><M-s>  <Esc>:split<CR><C-w>k:enew<CR>
" open terminal
nnoremap <silent> <M-S-n><M-S-l>  :tabnew<CR>:te<CR>A
nnoremap <silent> <M-S-n><M-S-r>  :vsplit<CR>:te<CR>A
nnoremap <silent> <M-S-n><M-S-c>  :vsplit<CR><C-w>h:te<CR>A
nnoremap <silent> <M-S-n><M-S-t>  :split<CR>:te<CR>A
nnoremap <silent> <M-S-n><M-S-s>  :split<CR><C-w>k:te<CR>A
tnoremap <silent> <M-S-n><M-S-l>  <C-\><C-n>:tabnew<CR>:te<CR>A
tnoremap <silent> <M-S-n><M-S-r>  <C-\><C-n>:vsplit<CR>:te<CR>A
tnoremap <silent> <M-S-n><M-S-c>  <C-\><C-n>:vsplit<CR><C-w>h:te<CR>A
tnoremap <silent> <M-S-n><M-S-t>  <C-\><C-n>:split<CR>:te<CR>A
tnoremap <silent> <M-S-n><M-S-s>  <C-\><C-n>:split<CR><C-w>k:te<CR>A
inoremap <silent> <M-S-n><M-S-l>  <Esc>:tabnew<CR>:te<CR>A
inoremap <silent> <M-S-n><M-S-r>  <Esc>:vsplit<CR>:te<CR>A
inoremap <silent> <M-S-n><M-S-c>  <Esc>:vsplit<CR><C-w>h:te<CR>A
inoremap <silent> <M-S-n><M-S-t>  <Esc>:split<CR>:te<CR>A
inoremap <silent> <M-S-n><M-S-s>  <Esc>:split<CR><C-w>k:te<CR>A
xnoremap <silent> <M-S-n><M-S-l>  <Esc>:tabnew<CR>:te<CR>A
xnoremap <silent> <M-S-n><M-S-r>  <Esc>:vsplit<CR>:te<CR>A
xnoremap <silent> <M-S-n><M-S-c>  <Esc>:vsplit<CR><C-w>h:te<CR>A
xnoremap <silent> <M-S-n><M-S-t>  <Esc>:split<CR>:te<CR>A
xnoremap <silent> <M-S-n><M-S-s>  <Esc>:split<CR><C-w>k:te<CR>A
" scratch
nnoremap <silent> <M-C-n><M-C-l>  :tabnew<CR>:Scratch<CR>A
nnoremap <silent> <M-C-n><M-C-r>  :vsplit<CR>:Scratch<CR>A
nnoremap <silent> <M-C-n><M-C-c>  :vsplit<CR><C-w>h:Scratch<CR>A
nnoremap <silent> <M-C-n><M-C-t>  :split<CR>:Scratch<CR>A
nnoremap <silent> <M-C-n><M-C-s>  :split<CR><C-w>k:Scratch<CR>A
tnoremap <silent> <M-C-n><M-C-l>  <C-\><C-n>:tabnew<CR>:Scratch<CR>A
tnoremap <silent> <M-C-n><M-C-r>  <C-\><C-n>:vsplit<CR>:Scratch<CR>A
tnoremap <silent> <M-C-n><M-C-c>  <C-\><C-n>:vsplit<CR><C-w>h:Scratch<CR>A
tnoremap <silent> <M-C-n><M-C-t>  <C-\><C-n>:split<CR>:Scratch<CR>A
tnoremap <silent> <M-C-n><M-C-s>  <C-\><C-n>:split<CR><C-w>k:Scratch<CR>A
inoremap <silent> <M-C-n><M-C-l>  <Esc>:tabnew<CR>:Scratch<CR>A
inoremap <silent> <M-C-n><M-C-r>  <Esc>:vsplit<CR>:Scratch<CR>A
inoremap <silent> <M-C-n><M-C-c>  <Esc>:vsplit<CR><C-w>h:Scratch<CR>A
inoremap <silent> <M-C-n><M-C-t>  <Esc>:split<CR>:Scratch<CR>A
inoremap <silent> <M-C-n><M-C-s>  <Esc>:split<CR><C-w>k:Scratch<CR>A
xnoremap <silent> <M-C-n><M-C-l>  <Esc>:tabnew<CR>:Scratch<CR>A
xnoremap <silent> <M-C-n><M-C-r>  <Esc>:vsplit<CR>:Scratch<CR>A
xnoremap <silent> <M-C-n><M-C-c>  <Esc>:vsplit<CR><C-w>h:Scratch<CR>A
xnoremap <silent> <M-C-n><M-C-t>  <Esc>:split<CR>:Scratch<CR>A
xnoremap <silent> <M-C-n><M-C-s>  <Esc>:split<CR><C-w>k:Scratch<CR>A
" resizing
nnoremap <silent> <M-+> <C-w>+
inoremap <silent> <M-+> <Esc><C-w>+
tnoremap <silent> <M-+> <C-\><C-n><C-w>+
xnoremap <silent> <M-+> <Esc><C-w>+
nnoremap <silent> <M--> <C-w>-
inoremap <silent> <M--> <Esc><C-w>-
tnoremap <silent> <M--> <C-\><C-n><C-w>-t
xnoremap <silent> <M--> <Esc><C-w>-
nnoremap <silent> <M->> <C-w>>
inoremap <silent> <M->> <Esc><C-w>>
tnoremap <silent> <M->> <C-\><C-n><C-w>>
xnoremap <silent> <M->> <Esc><C-w>>
nnoremap <silent> <M-<> <C-w><
inoremap <silent> <M-<> <Esc><C-w><
tnoremap <silent> <M-<> <C-\><C-n><C-w><
xnoremap <silent> <M-<> <Esc><C-w><
" other operations
nnoremap <silent> <M-l> :MaximizerToggle<CR>
inoremap <silent> <M-l> <Esc>:MaximizerToggle<CR>i
tnoremap <silent> <M-l> <C-\><C-n>:MaximizerToggle<CR>A
xnoremap <silent> <M-l> <Esc>:MaximizerToggle<CR>
nnoremap <M-m> :file term:://T-
tnoremap <M-m> <C-\><C-n>:file term:://T-
nnoremap <silent> <M-x> :BD<CR>
inoremap <silent> <M-x> <Esc>:BD<CR>
xnoremap <silent> <M-x> <Esc>:BD<CR>
tnoremap <silent> <M-x> <C-\><C-n>:BD<CR>
nnoremap <silent> <M-S-x> :BD!<CR>
inoremap <silent> <M-S-x> <Esc>:BD!<CR>
xnoremap <silent> <M-S-x> <Esc>:BD!<CR>
tnoremap <silent> <M-S-x> <C-\><C-n>:BD!<CR>
nnoremap <silent> <M-w> :BW<CR>
inoremap <silent> <M-w> <Esc>:BW<CR>
xnoremap <silent> <M-w> <Esc>:BW<CR>
tnoremap <silent> <M-w> <C-\><C-n>:BW<CR>
nnoremap <silent> <M-S-w> :BW!<CR>
inoremap <silent> <M-S-w> <Esc>:BW!<CR>
xnoremap <silent> <M-S-w> <Esc>:BW!<CR>
tnoremap <silent> <M-S-w> <C-\><C-n>:BW!<CR>

nnoremap <silent> àl :b#<CR>
tnoremap <silent> àl <C-\><C-n>:b#<CR>
nnoremap <silent> àm :bm<CR>
tnoremap <silent> àm <C-\><C-n>:bm<CR>

nnoremap <silent> à0 :BO<CR>
tnoremap <silent> à0 <C-\><C-n>:BO<CR>

" easy cd, ls and pwd opérations
nnoremap <M-'><M-'> :call feedkeys(':e<space><tab>', 't')<cr>
inoremap <M-'><M-'> <Esc>:call feedkeys(':e<space><tab>', 't')<cr>
xnoremap <M-'><M-'> <Esc>:call feedkeys(':e<space><tab>', 't')<cr>
tnoremap <M-'><M-'> <C-\><C-n>:call feedkeys(':e<space><tab>', 't')<cr>
nnoremap <M-'><M-v> :call feedkeys(':cd<space><tab>', 't')<cr>
inoremap <M-'><M-v> <Esc>:call feedkeys(':cd<space><tab>', 't')<cr>
xnoremap <M-'><M-v> <Esc>:call feedkeys(':cd<space><tab>', 't')<cr>
tnoremap <M-'><M-v> <C-\><C-n>:call feedkeys(':cd<space><tab>', 't')<cr>
nnoremap <M-'><M-c> :call feedkeys(':lcd<space><tab>', 't')<cr>
inoremap <M-'><M-c> <Esc>:call feedkeys(':lcd<space><tab>', 't')<cr>
xnoremap <M-'><M-c> <Esc>:call feedkeys(':lcd<space><tab>', 't')<cr>
tnoremap <M-'><M-c> <C-\><C-n>:call feedkeys(':lcd<space><tab>', 't')<cr>
nnoremap <M-'><M-w> :pwd<cr>
inoremap <M-'><M-w> <Esc>:pwd<cr>
xnoremap <M-'><M-w> <Esc>:pwd<cr>
tnoremap <M-'><M-w> <C-\><C-n>:pwd<cr>

" Allows changing tmux path
" if exists("$TMUX")
    " " Get the environment variable
    " let tmux_pane_name_cmd = 'tmux display -p \#D'
    " let tmux_pane_name = substitute(system(g:tmux_pane_name_cmd), "\n", "", "")
    " let tmux_env_var = "TMUX_PWD_" . substitute(g:tmux_pane_name, "%", "", "")
    " unlet tmux_pane_name tmux_pane_name_cmd
    " function! BroadcastTmuxCwd(s1)
        " execute("cd ".a:s1)
        " let filename = substitute(expand(getcwd()), $HOME, "~", "")
        " let output = system("tmux set -g status-right '".l:filename."  #[bg=yellow]#(echo $USER)@#H'")
    " endfunction
    " command! -nargs=? -complete=file CD
        " \ :call BroadcastTmuxCwd('<args>')
    " cmap cd CD
    " cmap lcd lc<space><bs>d
" endif
cmap te<Enter> te<Enter>A
