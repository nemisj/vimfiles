
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

""""""""""""""""""""""""""""""""""
" Pathogen injection
""""""""""""""""""""""""""""""""
call pathogen#infect() 

""""""""""""""""""""""""""""
" Enable Syntax Colors
""""""""""""""""""""""""""""
"  in GUI mode we go with fruity and Monaco 12
"  in CLI mode desert looks better (fruity is GUI only)
syntax on
if has("gui_running")
  colorscheme evening
  " set guifont=Monaco:h12
else
  " colorscheme cli_scheme
  " colorscheme koehler
  " set background=light
  set background=dark
  " let g:solarized_termcolors=16
  " colorscheme zenburn
  colorscheme solarized
  set t_Co=256 " enable 256 colors support in vim
  " set t_Co=16
endif


""""""""""""""""""""""""""""
" Setting cursor line highlighting
""""""""""""""""""""""""""""
set cursorline " doesn't remove from blured windows, need extra hack
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""""""""""""""""""""""""""""
" Tab Settings
""""""""""""""""""""""""""""
set tabstop=4
set smarttab
set shiftwidth=4
" Informaat is not using spaces instead of tabs
set noexpandtab

" adding visual cues to folds
set foldcolumn=1

" marking files when folds available
set foldmethod=marker

" complete paths on tab
set wildmode=list:longest,full

" show tabs, end of lines,etc
" irritates eyes 
" set list
" set listchars=tab:▸\ ,eol:¬

" normal movement, through screen lines instead of file lines
nnoremap j gj
nnoremap k gk

" doing scroll without moving cursor on screen position
noremap <C-j> j<C-e>
noremap <C-k> k<C-y>

" binding Ctrl_W+E to the NERDTree
nmap -- :call BenIndent()<cr> 
map <C-W>e :NERDTreeToggle .<cr>

" Generally, 'smartindent' or 'cindent' should only be set manually if you're
" not satisfied with how file type based indentation works.
set autoindent

filetype on
filetype indent on
filetype plugin on

set wrap

" wrap lines longer 80 chars
set textwidth=79
 
" show if line longer than 89 chars
" Onnly for vim 7.3
" set colorcolumn=85

" Statusbar and Linenumbers
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=0x%-8B                       " character value
set statusline+=%-14(%l,%c%V%)               " line, character
"set statusline+=%<%P                         " file position

" bells suck
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" start searching when typed
set incsearch

" highlight search
set hlsearch

function! PrepareXML( )
  " Deleting lines
  exec 'g/^\s*$/d' 
  " Joing lines
  exec '0,$j'
  exec "%s/> </>\r</g"
  exec "%s/></>\r</g"
  exec "set ft=xml"
  exec 'BenIndent'
endfunction
command! PrepareXML :call PrepareXML() 

function! PrepareJSON( )
  " Deleting lines
  exec 'g/^\s*$/d' 
  " Joing lines
  exec '0,$j'
  " Spliting all nodes
  exec "%s/{/{\r/g"
  exec "%s/{/\r{/g"
  exec "%s/}/\r}/g"
  exec '%s/},"/},\r"/g'
  exec '%s/,"/,\r"/g'
  exec 'set ft=javascript'
  exec 'BenIndent'
endfunction
command! PrepareJSON :call PrepareJSON() 

fun BenIndent()
  let oldLine=line('.')
  normal(gg=G)
  execute ':' . oldLine
endfun
map -- :call BenIndent()<cr> 
command! BenIndent :call BenIndent()

" spelling
setlocal spell spelllang=en_us
set spell

" toggle between visible 80-length mode
nnoremap <silent> <Leader>l
      \ :if exists('w:long_line_match') <Bar>
      \   silent! call matchdelete(w:long_line_match) <Bar>
      \   unlet w:long_line_match <Bar>
      \ elseif &textwidth > 0 <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>'.&tw.'v.\+', -1) <Bar>
      \ else <Bar>
      \   let w:long_line_match = matchadd('ErrorMsg', '\%>80v.\+', -1) <Bar>
      \ endif<CR>


" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"
" session management handling
"
function! RestoreSession()
	if argc() == 0 "vim called without arguments
		execute 'source ~/.vim/Session.vim'
	end
endfunction
" autocmd VimEnter * call RestoreSession()

function! SaveSession()
	exec ':mksession! ~/vim/Session.vim'
	exec 'wqa'
endfunction
command! SW :call SaveSession()

set ruler "Always show current position

""""""""""""""""""""""""""""""""""
" experiments
""""""""""""""""""""""""""""""""""
" highlight lines longer than 73 chars with ErrorMsg group color
" match ErrorMsg /\%>73v.\+/

" to define own group color
" highlight MyGroup ctermbg=red guibg=red gctermfg=yellow guifg=yellow term=bold

" searching for a template file for new files
" autocmd BufNewFile * silent! 0r ~/.vim/templates/%:e.tpl

" Changing to current dir of the file, so that :e gives us correct path
set autochdir

" Setting tasklist shortacts
" map T :TaskList<CR>

" making diff colors looks better
" highlight DiffDelete ctermfg=black ctermbg=yellow
" highlight DiffAdd ctermfg=black ctermbg=white
