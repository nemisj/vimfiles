#!/usr/bin/env bash

#########
# first of all making link to .vimrc file
current=$(cd $(dirname $0) && pwd)
ln -s $current/_vimrc ~/.vimrc
#
########

#########
# installing pathogen
mkdir -p ~/.vim/autoload
curl 'www.vim.org/scripts/download_script.php?src_id=16224' > ~/.vim/autoload/pathogen.vim
# creating link to the bundle
ln -s $current ~/.vim/bundle
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

#
##########
