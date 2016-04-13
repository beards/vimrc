#!/bin/bash

set -e

SCRIPT_NAME=${BASH_SOURCE[0]}
SRC_DIR=$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATE=$(date -d "today" +"%Y%m%d%H%M")

echo -e "#"
echo -e "# $SCRIPT_NAME: install necessary packages"
echo -e "#"
sudo apt-get install -y --fix-missing \
    libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev \
    gcc python-dev ruby-dev mercurial

echo -e "#"
echo -e "# $SCRIPT_NAME: download vim source"
echo -e "#"
mkdir -p ~/packages
cd ~/packages/
if [ ! -e "vim" ]; then
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
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-perlinterp \
            --enable-gui=gnome2 \
            --enable-cscope
make -j 4
sudo make install

echo -e "#"
echo -e "# $SCRIPT_NAME: set vimrc"
echo -e "#"
cd $SRC_DIR
./set_vimrc_ubuntu.sh

echo -e "#"
echo -e "# $SCRIPT_NAME: done !"
echo -e "#"

