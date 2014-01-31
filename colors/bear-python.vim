" my vim colorscheme for python
"
" modified from pychimp:
" https://github.com/Pychimp/Pychimp-vim
"
" color reference:
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

let g:colors_name = "bear-python"

" The Basic (Normal) Text Style

hi Normal      ctermfg=250  ctermbg=NONE  cterm=NONE

" All the Python related stuff

hi Number      ctermfg=45   ctermbg=NONE  cterm=bold  guifg=#00d7ff
hi Float       ctermfg=45   ctermbg=NONE  cterm=bold  guifg=#00d7ff
hi Statement   ctermfg=208  ctermbg=NONE  cterm=bold  guifg=#ff8700
hi Function    ctermfg=231  ctermbg=NONE  cterm=NONE  guifg=#ffffff
hi Conditional ctermfg=136  ctermbg=NONE  cterm=NONE  guifg=#af8700
hi Operator    ctermfg=208  ctermbg=NONE  cterm=NONE  guifg=#ff8700
hi Todo        ctermfg=253  ctermbg=NONE  cterm=bold  guifg=#dadada
hi Comment     ctermfg=8    ctermbg=NONE  cterm=NONE  guifg=#808080
hi Special     ctermfg=81   ctermbg=NONE  cterm=NONE  guifg=#5fd7ff
hi String      ctermfg=38   ctermbg=NONE  cterm=NONE  guifg=#00afd7
hi Include     ctermfg=118  ctermbg=NONE  cterm=bold  guifg=#87ff00
hi Error       ctermfg=88   ctermbg=172   cterm=bold  guifg=#870000
hi PreProc     ctermfg=81   ctermbg=NONE  cterm=NONE  guifg=#5fd7ff
hi Boolean     ctermfg=38   ctermbg=NONE  cterm=bold  guifg=#00afd7
hi Character   ctermfg=142  ctermbg=NONE  cterm=NONE  guifg=#afaf00

"Vim Stuff

hi Visual      ctermfg=253  ctermbg=235   cterm=NONE  guifg=#dadada
hi VertSplit   ctermfg=232  ctermbg=244   cterm=NONE  guifg=#080808
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold  guifg=#870000
hi MatchParen  ctermfg=16   ctermbg=215   cterm=bold  guifg=#000000  guibg=#ffaf5f
hi Folded      ctermfg=67   ctermbg=16    cterm=bold  guifg=#5f87af  guibg=#000000
hi FoldColumn  ctermfg=67   ctermbg=16    cterm=NONE  guifg=#5f87af  guibg=#000000
hi LineNr      ctermfg=236  ctermbg=NONE  cterm=NONE  guifg=#303030
hi NonText     ctermfg=58   ctermbg=NONE  cterm=NONE  guifg=#5f5f00
hi Pmenu       ctermfg=81   ctermbg=16    cterm=NONE  guifg=#5fd7ff
hi PmenuSel    ctermfg=202  ctermbg=16    cterm=NONE  guifg=#ff5f00
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE  guifg=#5fd7ff
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE  guifg=#5fd7ff
hi Search      ctermfg=253  ctermbg=66    cterm=NONE  guifg=#dadada
hi IncSearch   ctermfg=253  ctermbg=66    cterm=NONE  guifg=#dadada
hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE  guifg=#808000
hi TabLineSel  ctermfg=14   ctermbg=NONE  cterm=bold  guifg=#00ffff
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE  guifg=#00ff00

