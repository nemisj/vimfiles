
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

source ~/.vim/_include


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
  set t_Co=256 " enable 256 colors support in vim

  let g:molokai_original = 1
  let g:rehash256 = 1
  set background=dark
  colorscheme molokai


  " presentation mode
  " set background=light
  " colorscheme leya

endif

" stop webpack from ignoring changed files
set backupcopy=yes


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

" adding visual cues to folds
set foldcolumn=1

" marking files when folds available
set foldmethod=marker

" complete paths on tab
set wildmode=list:longest,full

" show tabs, end of lines,etc
" irritates eyes 
set list
set listchars=tab:▸\ ,eol:¬

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

filetype off
filetype plugin indent on

set wrap

" wrap lines longer 80 chars
"set textwidth=79
 
" show if line longer than 89 chars
" Onnly for vim 7.3
" set colorcolumn=85

" Statusbar and Linenumbers
set laststatus=2

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
  exec '%!python -m json.tool'
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

let g:syntastic_auto_loc_list = 1

let g:ctrlp_map = '<c-p>'
" let g:ctrlp_match_window_bottom = 0
" let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|node_modules|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

"
" Setting up vim-test
"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
