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
else
	# find out if this is our link
	target=$(readlink -f ~/.vimrc)
	if [ "$target" != "${current_dir}/_vimrc" ]; then
		echo "You have own .vimrc. Continue? (y/n)"
		read answer
		if [ $answer != "y" ]; then
			echo "Got '${answer}'. Ok. Quit"
			exit 1
		fi
	fi
fi

cd ${bundle_path}
if [ ! -e Vundle.vim ]; then
	echo "Going to install Vundle"
	git clone https://github.com/VundleVim/Vundle.vim.git
fi

# create link to the _include
cd ~/.vim
rm -rf _include
ln -s ${current_dir}/_include _include

# install plugins
vim +PluginInstall +qall

# add local config
rm -rf ${bundle_path}/local-config
ln -s ${current_dir}/local-config ${bundle_path}/local-config
