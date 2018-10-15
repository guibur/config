" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugins')

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-smooth-scroll'
Plug 'vim-scripts/camelcasemotion'
Plug 'majutsushi/tagbar'
Plug 'rbong/vim-vertical'
Plug 'tpope/vim-unimpaired'
" Colors
Plug 'blueyed/vim-diminactive'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'
" Help syntax
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'sbdchd/neoformat'
" Help navigation
Plug 'guibur/neovim-fuzzy'
Plug 'guibur/bufexplorer'
Plug 'muziqiushan/vim-bufonly'
Plug 'qpkorr/vim-bufkill'
Plug 'vim-scripts/scratch.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-fugitive'
Plug 'jpalardy/vim-slime'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'scrooloose/nerdtree'
" Language help
" Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' } " Works awesome, but super slow
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'arakashic/chromatica.nvim' " Strange coloring. Maybe need personalization…
Plug 'tyru/open-browser.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'craigemery/vim-autotag'
" Terminal plugins
Plug 'brettanomyces/nvim-editcommand'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:jedi#auto_initialization = 0
let g:jedi#goto_command = 'èo'
""""""""""""""""""""""""""""""""""""""""""""""""""
" Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste'],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'filetype', 'cwd' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'cwd': 'GetShortCwd'
    \ }
\}
function! GetShortCwd()
    return substitute(expand(getcwd()), $HOME, "~", "")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy-motion
""""""""""""""""""""""""""""""""""""""""""""""""""

map é <Plug>(easymotion-prefix)
nmap éé <Plug>(easymotion-bd-f)
nmap éj <Plug>(easymotion-t)
nmap éJ <Plug>(easymotion-T)
nmap éw <Plug>(easymotion-w)
nmap éW <Plug>(easymotion-W)
nmap éàe <Plug>(easymotion-ge)
nmap éàE <Plug>(easymotion-gE)
nmap ét <Plug>(easymotion-j)
nmap és <Plug>(easymotion-w)
nmap ér <Plug>(easymotion-sn)
nmap éy <Plug>(easymotion-bd-t)
nmap éx <Plug>(easymotion-bd-n)
nmap é* <Plug>(easymotion-next)
nmap é# <Plug>(easymotion-prev)
nmap én <Plug>(easymotion-bd-n)
nmap é. <Plug>(easymotion-repeat)

""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighter
""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:highlighter#auto_update = 0
" nmap gc :HighlighterUpdate<CR>
" let g:Highlighter#disabled_languages = ['py']
" let g:highlighter#project_root_signs = ['.git']


""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:case_switch_custom_definitions =
    \ [
    \   {
    \     '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \     '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
    \     '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
    \     '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
    \     '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \   }
    \ ]
let b:switch_custom_definitions = [
        \   {
        \     '\CRight': 'Left',
        \     '\CLeft' : 'Right',
        \     '\Ctrue' : 'false',
        \     '\Cfalse': 'true',
        \     '\CRIGHT': 'LEFT',
        \     '\CLEFT' : 'RIGHT',
        \   }
        \]
nnoremap gc :call switch#Switch({'definitions': g:case_switch_custom_definitions})<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Chromatica
""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:chromatica#libclang_path='/usr/lib/llvm-3.9/lib/'


""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""
" source ~/.config/nvim/plugins/ctab.vim
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "<TAB>"
inoremap <expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" : "<S-TAB>"
" inoremap <expr> <Esc>
    " \ pumvisible() ? deoplete#close_popup() : "\<Esc>"

""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake
""""""""""""""""""""""""""""""""""""""""""""""""""
" When writing a buffer, and on normal mode changes (after 750ms).
call neomake#configure#automake('nrw', 750)
let g:neomake_py_pylint_maker = {
    \ 'args': ['%:p', '--max-line-length=120']
    \ }

let g:neomake_py_flake_maker = {
    \ 'args': ['%:p', '--max-line-length=120']
    \ }

""""""""""""""""""""""""""""""""""""""""""""""""
" Tag bar
""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> àg :TagbarOpen fj<CR>
nmap <silent> àk :TagbarClose<CR>
let g:tagbar_map_togglesort = 'è'
let g:tagbar_map_toggleautoclose = 'a'
let g:tagbar_sort = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> à] :!cd ~/dev/wandercode && ctags -R . && cd -<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerSortBy='number'
nnoremap àà :BufExplorer<CR>
tnoremap àà <C-\><C-n>:BufExplorer<CR>
set hidden
set confirm

" Need to change plugging mappings internally


""""""""""""""""""""""""""""""""""""""""""""""""
" Dim inactive: dim inactive windows.
""""""""""""""""""""""""""""""""""""""""""""""""
let g:diminactive_enable_focus = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast and smooth movements
""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Camel case and undercore motion and text objects
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDisableDefaultKeyMapping = 1  " Avoid conflicts for <leader>b… mapping

map <nowait> <space>w <Plug>CamelCaseMotion_w
map <nowait> <space>b <Plug>CamelCaseMotion_b
map <nowait> <space>e <Plug>CamelCaseMotion_e

omap i<space>w <Plug>CamelCaseMotion_iw
xmap i<space>w <Plug>CamelCaseMotion_iw
omap i<space>b <Plug>CamelCaseMotion_ib
xmap i<space>b <Plug>CamelCaseMotion_ib
omap i<space>e <Plug>CamelCaseMotion_ie
xmap i<space>e <Plug>CamelCaseMotion_ie

""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd commenter: comment and uncomment easily
""""""""""""""""""""""""""""""""""""""""""""""""""
map ècc <plug>NERDCommenterComment
map ècu <plug>NERDCommenterUncomment
map ècb <plug>NERDCommenterMinimal
map ècy <plug>NERDCommenterYank
map èc$ <plug>NERDCommenterToEOL
map <silent> èca A <esc>:execute "normal \<plug>NERDCommenterAppend"<CR>A

let NERDSpaceDelims=1
" need to change plugin:
" - remove space after # in python comment symbols to avoid a double space
"   after # (need to keep NERDSpaceDelims at 1 for double space before end
"   of line comment

""""""""""""""""""""""""""""""""""""""""""""""""""
" Slime for sending code to ipython
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:slime_python_ipython = 1 "delete -q in ftplugin/python/slime.vim
let g:slime_target = "tmux"
let g:slimux_select_from_current_window = 1
let g:slime_no_mappings = 1
vmap èy <Plug>SlimeRegionSend
nmap èy <Plug>SlimeLineSend
nmap èY <Plug>SlimeConfig|<Plug>SlimeLineSend
vmap èY <Plug>SlimeConfig|<Plug>SlimeRegionSend

"""""""""""""""""""""""""""""""""""""""""""""""""
" Vim surround refactor mapping for bépo
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:surround_no_mappings = 1
let g:surround_no_insert_mappings = 1
nmap dk  <Plug>Dsurround
nmap lk  <Plug>Csurround
nmap lK  <Plug>CSurround
nmap yk  <Plug>Ysurround
nmap yK  <Plug>YSurround
nmap ykk <Plug>Yssurround
nmap yKk <Plug>YSsurround
nmap yKK <Plug>YSsurround
xmap K   <Plug>VSurround
xmap gK  <Plug>VgSurround

""""""""""""""""""""""""""""""""""""""""""""""""
" configuration for nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""
" active tree shortcut
map <silent> àf :NERDTreeFocus<CR>
map <silent> àx :NERDTreeClose<CR>
let g:NERDTreeMapOpenInTab = 'l'
let g:NERDTreeMapOpenInTabSilent = 'gl'
let g:NERDTreeMapOpenSplit = 'h'
let g:NERDTreeMapOpenVSplit = 'v'
let g:NERDTreeMapJumpFirstChild = 'S'
let g:NERDTreeMapJumpLastChild = 'T'
let g:NERDTreeMapJumpNextSibling = '<C-N>'
let g:NERDTreeMapJumpPrevSibling = '<C-J>'

" ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" ignore tree if it is the last left
augroup NerdTreeGroup
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""
" Vertical moving with indents
""""""""""""""""""""""""""""""""""""""""""""""""""

" vertically look for non-empty character
noremap <silent> <c-t> :Vertical f<CR>
noremap ]& <c-t>
noremap <silent> <c-s> :Vertical b<CR>
" require 'stty -ixon' in the .bashrc to disable the freezing behaviour of <c-s>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim unimpaired
""""""""""""""""""""""""""""""""""""""""""""""""""

" make shortcuts easier
nmap ]ê <Plug>unimpairedMoveDown
xmap ]ê <Plug>unimpairedMoveSelectionDown
xmap [ê <Plug>unimpairedMoveSelectionUp
nmap [ê <Plug>unimpairedMoveUp
nmap ]œ& & :call <SNR>170_setup_paste()<CR>o
nmap ]œ& & :call <SNR>170_setup_paste()<CR>O
" unmap >p
" unmap >P
" unmap <p
" unmap <P

""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <M-f> :FuzzyOpen<CR>
tnoremap <M-f> <C-\><C-n>:FuzzyOpen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit command from terminal
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:editcommand_prompt = '➭'
let g:editcommand_no_mappings = 1
tmap <c-x> <Plug>EditCommand


""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" Manual plugins
" source ~/.config/nvim/plugins/ctab.vim  "Inserted in the middle of deoplete to have better support of tab.
