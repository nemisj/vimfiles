#!/usr/bin/env bash

current=$(cd $(dirname $0) && pwd)

# creating link to the bundle
bundle_path=~/.vim/bundle
if [ -e ${bundle_path} ]; then
	mkdir -p ${bundle_path}
fi

cd ${bundle_path}
git clone https://github.com/gmarik/Vundle.vim.git


