""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch source to header
""""""""""""""""""""""""""""""""""""""""""""""""""
function! SwitchSourceHeader()
  "update!
  if (expand ("%:e") == "cc")
    find **/%:t:r.h
  else
    find **/%:t:r.cc
  endif
endfunction

nmap ès :call SwitchSourceHeader()<CR>
