#!/bin/bash

# stop on error
set -e

SCRIPT_NAME=${BASH_SOURCE[0]}
SRC_DIR=$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATE=$(date -d "today" +"%Y%m%d%H%M")

echo -e "#"
echo -e "# $SCRIPT_NAME: install necessary packages"
echo -e "#"
sudo yum install -y \
    gcc make \
    ncurses-devel \
    lua lua-devel \
    ruby ruby-devel \
    python python-devel \
    perl perl-devel perl-ExtUtils-Embed \
    mercurial

echo -e "#"
echo -e "# $SCRIPT_NAME: download vim source"
echo -e "#"
mkdir -p ~/packages
cd ~/packages/
if [ ! -d "vim" ]; then
    hg clone https://code.google.com/p/vim/
else
    cd vim
    hg update
fi

echo -e "#"
echo -e "# $SCRIPT_NAME: build vim"
echo -e "#"
cd ~/packages/vim/
./configure --with-features=huge \
            --enable-multibyte \
            --disable-selinux \
            --enable-cscope \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-rubyinterp \
            --enable-perlinterp \
            --enable-luainterp
make -j 4
sudo make install

echo -e "#"
echo -e "# $SCRIPT_NAME: set vimrc"
echo -e "#"
cd $SRC_DIR
./set_vimrc_centos.sh

echo -e "#"
echo -e "# $SCRIPT_NAME: done !"
echo -e "#"

