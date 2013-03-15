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

hi Number      ctermfg=45   ctermbg=NONE  cterm=bold
hi Float       ctermfg=45   ctermbg=NONE  cterm=bold
hi Statement   ctermfg=208  ctermbg=NONE  cterm=bold
hi Function    ctermfg=231  ctermbg=NONE  cterm=NONE
hi Conditional ctermfg=136  ctermbg=NONE  cterm=NONE
hi Operator    ctermfg=208  ctermbg=NONE  cterm=NONE
hi Todo        ctermfg=253  ctermbg=NONE  cterm=bold
hi Comment     ctermfg=8  ctermbg=NONE  cterm=NONE
hi Special     ctermfg=81   ctermbg=NONE  cterm=NONE
hi String      ctermfg=38   ctermbg=NONE  cterm=NONE
hi Include     ctermfg=118  ctermbg=NONE  cterm=bold
hi Error       ctermfg=88   ctermbg=172   cterm=bold
hi PreProc     ctermfg=81   ctermbg=NONE  cterm=NONE
hi Boolean     ctermfg=38   ctermbg=NONE  cterm=bold
hi Character   ctermfg=142  ctermbg=NONE  cterm=NONE

"Vim Stuff

hi Visual      ctermfg=253  ctermbg=235   cterm=NONE
hi VertSplit   ctermfg=232  ctermbg=244   cterm=NONE
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold
hi MatchParen  ctermfg=16   ctermbg=215   cterm=bold
hi Folded      ctermfg=67   ctermbg=16    cterm=bold
hi FoldColumn  ctermfg=67   ctermbg=16    cterm=NONE
hi LineNr      ctermfg=236  ctermbg=NONE  cterm=NONE
hi NonText     ctermfg=58   ctermbg=NONE  cterm=NONE
hi Pmenu       ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSel    ctermfg=202  ctermbg=16    cterm=NONE
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE
hi Search      ctermfg=253  ctermbg=66    cterm=NONE
hi IncSearch   ctermfg=253  ctermbg=66    cterm=NONE
hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE
hi TabLineSel  ctermfg=14   ctermbg=NONE  cterm=bold
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE

