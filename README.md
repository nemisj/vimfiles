# vimfiles

## Content of this package: 

* .vimrc
* Customization for filetypes
* Script for installing pathogen
* Script for quick installing of the most used pathogen bundles ( vimscripts ):
  - [Gundo](http://sjl.bitbucket.org/gundo.vim/)
    Visualizing your undo tree
  - [Snipmate](http://www.vim.org/scripts/script.php?script_id=2540)
    Powerful snippets
  - [VCSCommand](http://www.vim.org/scripts/script.php?script_id=90)
    Integration with most Version Control Systems
  - [Coffee-script](http://www.vim.org/scripts/script.php?script_id=3590)
    Support for coffee-script syntax and indentation
  - [JS-snippets](https://github.com/nemisj/vim-snipmate)
    Couple of snippets for mocha, expect.js and yui
  - [JSON indent](http://www.vim.org/scripts/script.php?script_id=3081)
    Correct indentation of json
  - [Solarized scheme](https://github.com/altercation/vim-colors-solarized)
    Colorscheme
  - [XML-edit](http://www.vim.org/scripts/script.php?script_id=301)
    XML-editing support
  - [NERDTree](http://www.vim.org/scripts/script.php?script_id=1658)
    Tree explorer for navigating filesystem
  - [Markdown](http://www.vim.org/scripts/script.php?script_id=2882)
    Support for markdown
  - [Align](http://www.vim.org/scripts/script.php?script_id=294)
    Help folks to align text, eqns, declarations, tables, etc 

## Installation

To install this package into a system clone this repo anywhere you like and execute
bootstrap.sh.

    git clone https://github.com/nemisj/vimfiles.git ~/vimfiles
    cd ~/vimfiles
    ./bootstrap.sh

That's it. Now your vim ready to go.

## Included in local config

after/ftplugin/javascript.vim

This plugin will help you to get 'gf' working in VIM when doing stuff for node.js. 
It will scan all the folders up to the root for node_modules and will add them to the 'path' variable of the VIM.
After that you could do gf on the require statements like:

var express = require('express');
and it will open the source folder of the express from the place which would node use :)
So, long living 'gf'. 

You would ask, why would i want that? Well, cause "Read the source,luke" is something what makes you a better programmer, right? :)




