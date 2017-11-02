setlocal tabstop=2
setlocal softtabstop=2 " makes the spaces feel like real tabs
setlocal shiftwidth=2
setlocal expandtab
let g:jsx_ext_required = 0

" Still no Align plugin
" preserv space when doing Align=|:
" autocmd FileType javascript AlignCtrl W

" let b:current_place = '.'
let b:current_place = escape(expand('%:p:h'), ' ')

" configure different lints
let b:eslint_rc = findfile('.eslintrc', b:current_place . ';')

if b:eslint_rc != ''
  let b:syntastic_checkers = ['eslint']
  let b:syntastic_javascript_eslint_args = '--config ' . fnamemodify(b:eslint_rc, ':p')
  let b:eslint_bin = findfile('node_modules/.bin/eslint', b:current_place . ';')

  if b:eslint_bin != ''
    let b:syntastic_javascript_eslint_exec = fnamemodify(b:eslint_bin, ':p')
  endif
endif

" Comment lines by using cc
" Uncomment lines by using cx
vmap <buffer> cc :s/^/\/\//<Esc><Esc>
vmap <buffer> cx :s/\/\/// <Esc><Esc>
nmap <buffer> cc V:s/^/\/\//<Esc><Esc>
nmap <buffer> cx V:s/\/\/// <Esc><Esc>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
