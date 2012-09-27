"
" vimrc
"

"
" vim-pathogen
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


"
" basic
"
set nocompatible
set history=50
set showcmd
set nomodeline      "ignore mode implication
set backspace=indent,eol,start      " allow backspacing over everything in insert mode

autocmd! bufwritepost .vimrc source ~/.vimrc " auto reload vimrc when editing it

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif


"
" encoding / format
"
if has("multi_byte")
  set fileencodings=utf-8,big5,cp950,gbk,cp936,iso-2022-jp,sjis,euc-jp,japan,euc-kr,ucs-bom,utf-bom,latin1,iso8859-1
  set fileencoding=utf-8
else
  set enc=taiwan
  set fileencoding=taiwan
endif
set fileformats=unix,dos,mac    "read variant
set fileformat=unix             "write unix


"
" indent
"
"set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab       "use space instead of tab
set autoindent
set smartindent

filetype on
filetype indent on
filetype plugin on
autocmd FileType Makefile setlocal noexpandtab    "disable tab replacement on Makefile


"
" folding
"
set foldmethod=indent
set foldlevel=3
set foldnestmax=3


"
" search
"
set incsearch       "highlight while typing
set hlsearch        "highlight search result
set smartcase       "ignore case if search pattern is all lowercase,case-sensitive otherwise


"
" theme / color / syntax
"
set background=dark
syntax on
colorscheme torte
"set t_Co=256


"
" markup
"
set number          "line number
set ruler
set showmatch       "show bracket matching
set nocursorline
set laststatus=2    "always show status 
set statusline=\ %{HasPaste()}%-20.(%f\ %m%r%h\ %w%)\ 
set statusline+=\ %<%30(\ \ \ %{hostname()}:%{CurDir()}%)\ 
set statusline+=%=\ [%c%V,\ %l/%L]\ [%{&ff}/%{&fileencoding}/%Y]

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction


"
" sudo write command
"
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! Wq :execute ':W' | :q


"
" key mappings
"
set <F1>=[11~
set <F2>=[12~
set <F3>=[13~
set <F4>=[14~
let mapleader=","

" help
nnoremap <silent> <F1> :call Help()<CR>
inoremap <silent> <F1> <Esc><F1>
autocmd FileType help noremap <buffer> q :close<CR>

let g:last_help_keyword = ''
function! Help()
  echo match(expand("<cWORD>"), g:last_help_keyword)
  if &buftype=="help" && match(expand("<cWORD>"), g:last_help_keyword)>0
    bw
  else
    try
      let g:last_help_keyword=expand("<cWORD>")
      exec "help ".g:last_help_keyword
    catch /:E149:\|:E661:/
      " E149 no help for <subject>
      " E661 no <language> help for <subject>
      let g:last_help_keyword=expand("<cword>")
      exec "help ".expand("<cword>")
    endtry
  endif
endfunc


" for splits
noremap <silent> <C-J> <C-W>j
noremap <silent> <C-K> <C-W>k
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-l> <c-w>l
noremap <silent> <F6> <c-w>w
inoremap <silent> <F6> <c-o><c-w>w

" for mouse selection / paste
noremap <silent> <F2> :set nu! paste!<CR>
set pastetoggle=<F2>

" search next/previous
set <s-F3>=[25~
noremap <F3> n
noremap <s-F3> N
inoremap <F3> <c-o>n
inoremap <s-F3> <c-o>N
noremap <F4> :set hls!<BAR>set hls?<CR>
inoremap <F4> <c-o>:set hls!<BAR>set hls?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv


"
" omni complete
" 
set completeopt=longest,menuone,preview
" If you prefer the Omni-Completion tip window to close when a selection is made, 
" these lines close it on movement in insert mode or when leaving insert mode
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
:highlight Pmenu ctermfg=15 ctermbg=4
:highlight PmenuSel ctermfg=2 ctermbg=5


"
" Taglist variables
" (require exuberant-ctags: http://ctags.sourceforge.net/
"  use 'sudo apt-get install exuberant-ctags' to install)
"
let g:ctags_statusline=1        " Display function name in status bar
let generate_tags=1             " Automatically start script
let Tlist_Use_Horiz_Window=0    " Displays taglist results in a vertical window
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
nnoremap <silent> <F11> :TlistToggle<CR>
inoremap <silent> <F11> <c-o>:TlistToggle<CR>


"
" Nerd Tree
"
nnoremap <silent> <F12> :NERDTree<CR>
inoremap <silent> <F12> <c-o>:NERDTree<CR>
autocmd FileType nerdtree nnoremap <silent><buffer> <F12> :close<CR>


"
" python
"
" python.vim: syntax highlight
autocmd FileType python setlocal complete+=k~/.vim/syntax/python.vim isk+=.,(
" help key mapping
autocmd FileType python map <buffer> <F1> K
autocmd FileType python imap <buffer> <F1> <ESC>K
" flake8: ignore E501 line too long
let g:flake8_ignore="E501,W391"
" auto complete
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" run script
autocmd FileType python command! RunPyBuffer call DoRunPyBuffer()
autocmd FileType python nnoremap <buffer><silent> <F9> :RunPyBuffer<CR>
autocmd FileType python inoremap <buffer><silent> <F9> <ESC>:w<CR>:RunPyBuffer<CR>
autocmd FileType output noremap <silent><buffer> q :close<CR>

function! DoRunPyBuffer()
    " force preview window closed
    pclose!
    " copy the buffer into a new window, then run that buffer through python
    silent %y a | below 10 new | silent put a | silent %!python -
    " indicate the output window as the current previewwindow
    setlocal previewwindow ro nomodifiable nomodified filetype=output
    " back into the original window
    winc p
endfunction


"
" php
"
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal foldmethod=syntax
autocmd FileType php let php_folding=2


"
" set screen title
"
set titlestring=%t%(\ %M%)
if &term == "screen" || &term == "screen-bce"
  set t_ts=k
  set t_fs=\
endif
if &term == "screen" || &term == "screen-bce" || &term == "xterm"
  set title
endif

