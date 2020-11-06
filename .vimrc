"
" vimrc
"

"
" basic
"
scriptencoding utf-8

set nocompatible
set history=50
set showcmd
set nomodeline      "ignore mode implication
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set textwidth=0

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
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
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
set tabstop=4
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
set ignorecase      "search in case insensitive
set smartcase       "switch to do case sensitive search when patterns contains upper case chars


"
" theme / color / syntax
"
set background=dark
set t_Co=256
syntax on
colorscheme torte

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END


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

" for tabs
noremap <silent> tg gT

" for splits
noremap <silent> <C-J> <C-W>j
noremap <silent> <C-K> <C-W>k
noremap <silent> <c-h> <c-w>h
noremap <silent> <c-l> <c-w>l
noremap <silent> <F6> <c-w>w
inoremap <silent> <F6> <c-o><c-w>w
inoremap <silent> <c-w> <c-o><c-w>

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

" line numbers show/hide and normal/relative
noremap <silent> <F2> :call ToggleLineNumbers()<CR>
nnoremap <silent><buffer> <leader>n :call ToggleRelative()<CR>

" paste mode
set pastetoggle=<F2>


"
" set screen title
"
set titlestring=%t%(\ %M%)
"if &term == "screen" || &term == "screen-bce"
if match($TERM, "screen") != -1
    set t_ts=k
    set t_fs=\
    "set term=xterm-256color
    let g:GNU_Screen_used = 1
    set title
elseif match(&term, "xterm") != -1
    set title
endif


"
" for trailing whitespaces
"
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
set list  " show trailing whitespace
set listchars=tab:▸\ ,trail:▫

nnoremap <silent> <leader>ts :call TrimWhiteSpace()<cr>


"
" c / cpp
"
autocmd FileType c setlocal foldmethod=syntax
autocmd FileType cpp setlocal foldmethod=syntax
" auto-strip trailing whitespaces
autocmd BufWritePre *.c :call TrimWhiteSpace()
autocmd BufWritePre *.cpp :call TrimWhiteSpace()
autocmd BufWritePre *.cc :call TrimWhiteSpace()
autocmd BufWritePre *.h :call TrimWhiteSpace()
autocmd BufWritePre *.hpp :call TrimWhiteSpace()


"
" python
"
" header
"autocmd BufNewFile *.py call setline(1, ["#!/usr/bin/env python", "", ""]) | normal G
autocmd FileType python map <leader>! gg O#!/usr/bin/env python<CR><CR><ESC>
" colorscheme
autocmd BufRead,BufNewFile *.py :colorscheme bear-python
" auto-strip trailing whitespaces
autocmd BufWritePre *.py :call TrimWhiteSpace()
" smartindent:
" When typing '#' as the first character in a new line, the indent for
" that line is removed, the '#' is put in the first column.  The indent
" is restored for the next line.
" If you don't want this, use this
" mapping: ":inoremap # X^H#", where ^H is entered with CTRL-V CTRL-H.
" When using the ">>" command, lines starting with '#' are not shifted
" right.
autocmd FileType python inoremap # X#
" run script
autocmd FileType python command! RunPyBuffer call DoRunPyBuffer()
autocmd FileType python nnoremap <buffer><silent> <F5> :RunPyBuffer<CR>
autocmd FileType python inoremap <buffer><silent> <F5> <ESC>:w<CR>:RunPyBuffer<CR>
autocmd FileType output noremap <silent><buffer> q :close<CR>

function! DoRunPyBuffer()
    " force preview window closed
    pclose!
    "windo if filetype == 'output' | wincmd q | endif
    " copy the buffer into a new window, then run that buffer through python
    silent %y a | below 10 new | silent put a | silent %!python -
    " indicate the output window as the current previewwindow
    setlocal previewwindow ro nomodifiable nomodified filetype=output
    " back into the original window
    "winc p
endfunction


"
" php
"
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType php setlocal foldmethod=syntax
autocmd FileType php let php_folding=2


"
" plugins
"
" using vundle for management
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle.git'

" easy motion
"
Bundle 'Lokaltog/vim-easymotion.git'

" SearchComplete
"
"Bundle 'SearchComplete'  " disabled due to it disturbs arrow keys

" MultipleSearch
"
Bundle 'MultipleSearch'
" (default mapping: <leader>* to highlight current word)
" (:Search <pattern1> - highlights all occurrences of <pattern1> in the current buffer)
" (:SearchReset - to clear the highlighting)
" (:SearchReinit)

" Nerd Tree
"
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
nnoremap <silent> <F12> :NERDTreeMirrorToggle<CR>
inoremap <silent> <F12> <c-o>:NERDTreeMirrorToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$[[file]]', '\.pyc$[[file]]', '\.swp$[[file]]', '\.git$[[dir]]', '\.class[[file]]']
let g:nerdtree_tabs_open_on_gui_startup=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <leader>f :NERDTreeFind<CR>

" Taglist variables
" (require exuberant-ctags: http://ctags.sourceforge.net/
"  use 'sudo apt-get install exuberant-ctags' to install)
"
Bundle 'vim-scripts/taglist.vim.git'
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

" pep8-indent for python
"
Bundle 'hynek/vim-python-pep8-indent.git'

" syntastic
"
Bundle 'scrooloose/syntastic'
" python syntax checking: flake8 (http://pypi.python.org/pypi/flake8, use 'sudo pip install flake8' to install)
" ignore E501 line too long
" ignore W391 blank line at end of file
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,W391'
let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_default_include_dirs = 1
let g:syntastic_cpp_auto_refresh_includes = 1



" ack
" (require ack-grep: http://betterthangrep.com/
"  use 'sudo apt-get install ack-grep' to install)
"
Bundle 'mileszs/ack.vim'
nnoremap <silent> <leader>F :Ack!<CR>

" vim-indent-guides
"
" (default shortcur: <leader>ig
Bundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0
"let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 1

" python.vim
" (Enhanced version of the python syntax highlighting script)
"
Bundle 'vim-scripts/python.vim--Vasiliev'
autocmd BufRead,BufNewFile *.py let python_highlight_all=1

" jedi-vim
" (for python auto-completion)
"
"Bundle 'davidhalter/jedi-vim'
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#use_tabs_not_buffers = 1

" vim-gitgutter
"
"Bundle 'airblade/vim-gitgutter'
"let g:gitgutter_enabled = 0
"nnoremap <silent> <F8> :GitGutterToggle<CR>
"nnoremap <silent> <leader>h :GitGutterNextHunk<CR>
"nnoremap <silent> <leader>H :GitGutterPrevHunk<CR>

" ctrlp
" for finding files
"
Bundle 'kien/ctrlp.vim'

" vcscommand.vim
" for git diff viewing
"
Bundle 'git://repo.or.cz/vcscommand'


" " YouCompleteMe
" " (require cmake: http://www.cmake.org/
" "  use 'sudo apt-get install cmake' to install)
" " (require clang: http://clang.llvm.org/
" "  use 'bash_env/scripts/build_clang.sh' to install)
" " (also need to build, run the command below after BundleInstall
" "  '~/.vim/bundle/YouCompleteMe/install.sh --clang-completer')
" "
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" let g:ycm_add_preview_to_completeopt=1
" let g:ycm_autoclose_preview_window_after_completion=0
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_complete_in_comments_and_strings=1
" let g:ycm_collect_identifiers_from_comments_and_strings=1
" let g:ycm_confirm_extra_conf=0
" let g:ycm_error_symbol='e>'
" let g:ycm_warning_symbol='w>'
" let g:ycm_always_populate_location_list=1
" "let g:ycm_goto_buffer_command = 'new-or-existing-tab'
" nnoremap <silent> <F9> :YcmForceCompileAndDiagnostics<CR>
" inoremap <silent> <F9> <c-o>:YcmForceCompileAndDiagnostics<CR>
" nnoremap <leader>g :YcmCompleter GoTo<CR>
" nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>gi :YcmCompleter GoToDefinition<CR>
" nnoremap <leader>l :lopen<CR>
" nnoremap ]e :lnext<CR>
" nnoremap [e :lprev<CR>

