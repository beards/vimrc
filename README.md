bear's vimrc
============

INSTALL
-------

after clone please run:  

    `git submodule init`  
    `git submodule update`  

require 'exuberant-ctags' for plugin 'taglist':  

    `sudo apt-get install exuberant-ctags`  

require 'flake8' for plugin 'vim-flake8':  

    `sudo pip install flake8`  


PLUGINS
-------

* [pathogen](https://github.com/tpope/vim-pathogen.git): makes it super easy to install plugins and runtime files in their own private directories  
* [supertab](https://github.com/ervandew/supertab): allows you to use <Tab> for all your insert completion needs  
* [taglist](https://github.com/vim-scripts/taglist.vim): provides an overview of the structure of source code  
* [nerd Tree](https://github.com/scrooloose/nerdtree.git): allows you to explore your filesystem and to open files and directories  
* [easy motion](https://github.com/Lokaltog/vim-easymotion.git): provides a much simpler way to use some motions in vim  
    `,,w` forward easy motion  
    `,,b` backward easy motion  
    `,,f` easy motion for target char  
* [python.vim](https://github.com/vim-scripts/python.vim--Vasiliev): enhanced python syntax highlight  
* [pep8-indent](https://github.com/hynek/vim-python-pep8-indent.git): fix vim default terrible auto indent  
* [pydoc.vim](https://github.com/fs111/pydoc.vim): python doc  
    `K` show document according to current cursor  
    map `K` to `<F1>`  
* [flake8](https://github.com/nvie/vim-flake8): python syntax checking and format checking  
    `<F7>` show checking result  
* [cureErrorMarker](https://github.com/Twinside/vim-cuteErrorMarker): pretty inline error message marker  
  
REFERENCE
---------

https://github.com/vgod/vimrc  
http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/  

