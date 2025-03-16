# vimfiles

## Content of this package: 

* .vimrc
* Customization for filetypes
* Script for installing vim-plug
* Script for quick installing of the most used pathogen bundles ( vimscripts ):
  (see `_include` file )

## Installation

To install this package into a system clone this repo anywhere you like and execute
bootstrap.sh.

    git clone https://github.com/nemisj/vimfiles.git ~/vimfiles
    cd ~/vimfiles
    ./bootstrap.sh

That's it. Now your vim ready to go.

## Included in local config

### Node.js and 'gf' combination
__after/ftplugin/javascript.vim__

This plugin will help you to get 'gf' working in VIM when doing stuff for node.js. 
It will scan all the folders up to the root for node_modules and will add them to the 'path' variable of the VIM.
After that you could do gf on the require statements like:

    var express = require('express');

and it will open the source folder of the express from the place which would node use :)
So, long living 'gf'. 

You would ask, why would i want that? Well, cause "Read the source,luke" is something what makes you a better programmer, right? :)




