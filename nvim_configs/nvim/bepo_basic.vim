" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap c h
noremap r l
" {ts} = « haut / bas »
noremap t j
noremap s k
" {CR} = « haut / bas de l'écran »
noremap C H
noremap R L
" {TS} = « joindre / aide »
noremap <C-J> J
noremap S K
" Corollaire : repli suivant / précédent
noremap zs zj
noremap zt zk

" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
   " {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap ll cc
noremap L C
   " {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
noremap H R
   " {K} = « Substitue »          (k = caractère, K = ligne)
   " Corollaire : correction orthographique
noremap ]h ]s
noremap [h [s

" Other
" ———————————————————————————————

noremap , :
noremap ’ ,

" Gestion des fenêtres
" ———————————————————————————————
noremap àt <C-w>j
noremap às <C-w>k
noremap àc <C-w>h
noremap àr <C-w>l
noremap àq <C-w>c
noremap àh <C-w>s
noremap àv <C-w>v
noremap ào <C-w>o
noremap à<SPACE> :split<CR>
noremap à<CR> :vsplit<CR>
