""""""""""""""""""""""""""""""""""""""""""""""""""
" General colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
hi ColorColumn ctermbg=0
hi LineNr ctermfg=184 ctermbg=0
hi CursorLineNr ctermbg=184 ctermfg=0
hi MatchParen ctermbg=NONE ctermfg=1 cterm=underline
hi NeomakeError ctermfg=NONE ctermbg=NONE cterm=underline
hi NeomakeWarning ctermfg=NONE ctermbg=NONE cterm=underline
hi DiffChange cterm=NONE ctermfg=NONE ctermbg=0
hi DiffText cterm=NONE ctermfg=NONE ctermbg=54
hi DiffDelete cterm=NONE ctermfg=NONE ctermbg=124
hi DiffAdd cterm=NONE ctermfg=NONE ctermbg=22
set nohlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight of errors
""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight unwanted spaces
highlight UnwantedSpaces ctermbg=red ctermfg=white
call matchadd('UnwantedSpaces', ' \| ', 51)
highlight TrailingSpaces ctermbg=green
call matchadd('TrailingSpaces', '\s\+$', 52)

" highlight the errors in the terminal
" highlight MakeErrors ctermbg=124 ctermfg=white
highlight MakeErrors cterm=bold ctermfg=124
call matchadd('MakeErrors', '.*: error: .*', 55)
highlight MakeWarnings cterm=bold ctermfg=202
call matchadd('MakeWarnings', '.*: warning: .*', 54)

" highlight line too long (120 char)
highlight OverLength ctermbg=blue ctermfg=white guibg=#592929
call matchadd('OverLength', '\%121v.\+', 53)


""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parenthesis configuration
""""""""""""""""""""""""""""""""""""""""""""""""

let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'firebrick'],
\	'ctermfgs': ['brown', 'lightblue', 207, 'lightgreen', 98],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

let g:rainbow_active = 1
