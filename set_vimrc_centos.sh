#!/bin/bash

# stop on error
set -e

SCRIPT_NAME=${BASH_SOURCE[0]}
SRC_DIR=$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
DATE=$(date -d "today" +"%Y%m%d%H%M")


echo -e "#"
echo -e "# $SCRIPT_NAME: set vimrc"
echo -e "#"
cd $SRC_DIR
git submodule init
git submodule update --init --recursive
git submodule foreach --recursive "(git checkout master; git pull --rebase)"

set +e
cd ~
mv .vim .vim.bak.$DATE &> /dev/null
ln -s $SRC_DIR .vim
mv .vimrc .vimrc.bak.$DATE &> /dev/null
ln -s .vim/.vimrc
mv .gvimrc .gvimrc.bak.$DATE &> /dev/null
ln -s .vim/.gvimrc
set -e

echo -e "#"
echo -e "# $SCRIPT_NAME: install depending packages of plugins"
echo -e "#"
sudo yum install -y ctags python-devel python-setuptools
sudo easy_install pip
sudo pip install flake8

vim +BundleInstall +qall

sudo yum install -y gcc-c++ cmake28
set +e
sudo ln -s /usr/bin/cmake28 /usr/local/bin/cmake
cd ~/.vim/bundle/YouCompleteMe/
./install.py --clang-completer


echo -e "#"
echo -e "# $SCRIPT_NAME: done !"
echo -e "#"
