#!/usr/bin/env bash

echo "Preparing vim environment"

current=$(cd $(dirname $0) && pwd)

# creating link to the bundle
bundle_path=~/.vim/plugged
current_dir=$(cd $(dirname $0) && pwd)

if [ ! -d ${bundle_path} ]; then
	echo "Creating plugged folder"
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

# create link to the _include
echo "Creating link to _include file"
cd ~/.vim
rm -rf _include
ln -s ${current_dir}/_include _include

# install plugins
echo "Installing plugins using vim-plug"
vim +PlugInstall +qall

# add local config
echo "Updateing local-config"
rm -rf ${bundle_path}/local-config
ln -s ${current_dir}/local-config ${bundle_path}/local-config
