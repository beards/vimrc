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
autocmd FileType Makefile set noexpandtab    "disable tab replacement on Makefile


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

" for splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <c-h> <c-w>h
map <c-l> <c-w>l
map <F6> <c-w>w
imap <F6> <c-o><c-w>w

" for mouse selection / paste
map <F2> :set nu! paste!<CR>
set pastetoggle=<F2>

" search next/previous
set <s-F3>=[25~
map <F3> n
map <s-F3> N
imap <F3> <c-o>n
imap <s-F3> <c-o>N
map <F9> :set hls!<BAR>set hls?<CR>
imap <F9> <c-o>:set hls!<BAR>set hls?<CR>

" allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv


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
nnoremap TT :TlistToggle<CR>    
map <F4> :TlistToggle<CR>


"
" python
"
" python.vim: syntax highlight
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
let g:pydiction_location='~/.vim/bundle/pydiction/complete-dict'


"
" php
"
autocmd FileType php set omnifunc=phpcomplete#CompletePHP


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

