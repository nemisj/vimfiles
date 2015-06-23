#!/usr/bin/env bash

current=$(cd $(dirname $0) && pwd)

# creating link to the bundle
bundle_path=~/.vim/bundle
current_dir=$(cd $(dirname $0) && pwd)

if [ ! -d ${bundle_path} ]; then
	mkdir -p ${bundle_path}
fi

if [ ! -e ~/.vimrc ]; then
	echo "Will link .vimrc to $(pwd)/_vimrc"
	ln -s ${current_dir}/_vimrc ~/.vimrc
fi

cd ${bundle_path}
git clone https://github.com/gmarik/Vundle.vim.git

# create link to the _include
cd ~/.vim
ln -s ${current_dir}/_include _include

# install plugins
vim +PluginInstall +qall
