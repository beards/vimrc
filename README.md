bear's vimrc
============

INSTALL
-------

This vimrc use YouCompleteMe so require VIM 7.3.584 or newer,
if your VIM is not new enough, you may have to build VIM from the source.
You may choose to run `./build_vim_ubuntu.sh` that doing all setup jobs,
below is the detail steps.

after clone please run:  
    `git submodule init`  
    `git submodule update --init --recursive`  
    `git submodule foreach --recursive "(git checkout master; git pull --rebase)"`  

require vim at least version 7.3.584 for YouCompleteMe

require 'exuberant-ctags' for plugin 'taglist':  
    `sudo apt-get install exuberant-ctags`  

require 'flake8' for plugin 'vim-flake8':  
    `sudo pip install flake8`  

require 'ack-grep' for plugin 'ack.vim'"  
    `sudo apt-get install ack-grep`  

finally let Vundle install all plugins  
    `vim +BundleInstall +qall`  


PLUGINS
-------

* [Vundle](https://github.com/gmarik/vundle): Vim plugin manager  
* [easy motion](https://github.com/Lokaltog/vim-easymotion.git): provides a much simpler way to use some motions in vim  
    `,,w` forward easy motion  
    `,,b` backward easy motion  
    `,,f` easy motion for target char  
* [MultipleSearch](http://www.vim.org/scripts/script.php?script_id=479): highlight multiple searches at the same time, each with a different color  
* [nerd Tree](https://github.com/scrooloose/nerdtree.git): allows you to explore your filesystem and to open files and directories  
* [vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs): making NERDTree feel like a true panel, independent of tabs  
    `<F12>` to open file tree panel  
* [taglist](https://github.com/vim-scripts/taglist.vim): provides an overview of the structure of source code  
    `<F11>` to open tag list panel  
* [vim-python-pep8-indent](https://github.com/hynek/vim-python-pep8-indent): a nicer Python indentation style for vim  
* [syntastic](https://github.com/scrooloose/syntastic): syntax checking plugin for Vim  
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe): a fast, as-you-type, fuzzy-search code completion engine for Vim  
    `,g` go to definition / declaration  
    `<F9>` force compile and diagnostics  
* [ack.vim](https://github.com/mileszs/ack.vim): allow you to run ack from vim, and shows the results in a split window  
    `,F` search current word
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides): visually displaying indent levels in Vim
    `,ig` toogle indent guide show / hide
* [python.vim](https://github.com/vim-scripts/python.vim--Vasiliev): enhanced version of the python syntax highlighting script  
* [ctrlp](https://github.com/kien/ctrlp.vim): fuzzy file, buffer, mru, tag, etc finder  
    `<ctrl>+p` launch ctrlp  
* [vcscommand.vim](http://www.vim.org/scripts/script.php?script_id=90): manipulating files controlled by CVS, SVN, SVK, git, bzr, and hg within VIM  
    `:VCSVimDiff` do vim diff  


CUSTOMIZING
-----------

* always show relative line numbers in current buffer, and show absolute line numbers in others  
    `<ctrl>+n` switch relative / absolute line number  
* auto trim trailing spaces when save particular types of files  
    `,ts` manually call TrimWhiteSpace()  
* alias `tg` to `gT`  
* `<F4>` toogle highlight search  
* `<F2>` toogle line number in normal mode, toogle paste mode in editing mode  


REFERENCE
---------

https://github.com/vgod/vimrc  
http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/  

