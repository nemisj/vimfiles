#!/usr/bin/env bash

#########
# first of all making link to .vimrc file
current=$(cd $(dirname $0) && pwd)

# doing check if .vimrc already exists
if [ -e ~/.vimrc ]; then
	echo "WARNING: .vimrc already available"
else
	echo "Linking .vimrc to $current/_vimrc"
	ln -s $current/_vimrc ~/.vimrc
fi

#
########

# creating link to the bundle
bundle_path=~/.vim/bundle
if [ -e $bundle_path ]; then
	echo "WARNING: Pathogen bundle already in place"
else
	echo "Making link for pathogen bundle"
	ln -s $current $bundle_path
fi

#########
# installing pathogen
pathegen_path=~/.vim/autoload/pathogen.vim
# check if pathogen.vim is already availbale
if [ -e $pathegen_path ]; then
	echo "Pathogen is installed"
else
	echo "Installing pathegon into $pathegen_path"
	mkdir -p ~/.vim/autoload
	curl 'www.vim.org/scripts/download_script.php?src_id=16224' > $pathegen_path
fi

#
#########

##########
# clone all the bundles we need for vim

# Gundo for nize undo tree
git clone https://github.com/sjl/gundo.vim.git vim-gundo

# snipmate for easy to use snippets
git clone https://github.com/msanders/snipmate.vim vim-snipmate.vim

# vsc command support within the vim
git clone git://repo.or.cz/vcscommand vim-vcscommand

#coffee script support in vim
git clone https://github.com/kchmck/vim-coffee-script.git vim-coffee-script

# extending js snippets
git clone git://github.com/nemisj/vim-snipmate.git vim-snipmate

# indenting of js and json
svn co http://web-indent.googlecode.com/svn/trunk vim-indent-readonly 

# and ofcourse solarized color scheme
git clone git://github.com/altercation/vim-colors-solarized.git vim-solarized

# xml plugin for easier editing xml
git clone https://github.com/sukima/xmledit.git vim-xmledit

# nerd tree
git clone https://github.com/scrooloose/nerdtree.git vim-nerdtree

# markdown
git clone https://github.com/hallison/vim-markdown vim-markdown

#
##########

