"
" vimrc
"
" select required parts to include as source
"

source ~/.vim/.vimrc_basic
source ~/.vim/.vimrc_plugins

"source ~/.vim/.vimrc_ycm
"source ~/.vim/.vimrc_cpp
"source ~/.vim/.vimrc_python
"source ~/.vim/.vimrc_golang


"
" Function to source only if file exists
"
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

call SourceIfExists("~/.vimrc_local")

