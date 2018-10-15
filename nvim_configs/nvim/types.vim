augroup TypeDependentSettings
    au!
    au BufNewFile,BufRead *.tpp
        \ set filetype=cpp

    au BufNewFile,BufRead *.h,*.c,*.cc,*.tpp
        \ set noexpandtab |
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set foldmethod=syntax |
        \ set list lcs=tab:\|\ 

    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix |
        \ set comments+=:# |
        \ set foldmethod=indent |

    " ignore tree if it is the last left
    " autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    au TermOpen * call s:termSpecificLocalChanges() | call s:termSpecificChangingChanges()
    au BufEnter,WinEnter * call s:termSpecificChangingChanges()

augroup END


fun! s:termSpecificLocalChanges()
    if &buftype ==# 'terminal'
        setlocal nonumber
        setlocal norelativenumber
    endif
endfun
fun! s:termSpecificChangingChanges()
    if &buftype ==# 'terminal' || &buftype ==# 'nofile'
        hi clear OverLength
        highlight MakeErrors cterm=bold ctermfg=124
        highlight MakeWarnings cterm=bold ctermfg=202
    else
        highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
        hi clear MakeErrors
        hi clear MakeWarnings
    endif
endfun
