setlocal tabstop=2
setlocal softtabstop=2 " makes the spaces feel like real tabs
setlocal shiftwidth=2
setlocal expandtab

" Still no Align plugin
" preserv space when doing Align=|:
" autocmd FileType javascript AlignCtrl W

" configure different lints
let b:eslint_rc = findfile('.eslintrc', escape(expand('%:p:h'), ' ') . ';')

if b:eslint_rc != ''
  let b:syntastic_checkers = ['eslint']
  let b:syntastic_javascript_eslint_args = '--config ' . b:eslint_rc
  let b:eslint_bin = findfile('node_modules/.bin/eslint', escape(expand('%:p:h'), ' ') . ';')

  if b:eslint_bin != ''
    let b:syntastic_javascript_eslint_exec = b:eslint_bin
  endif
endif

" Comment lines by using cc
" Uncomment lines by using cx
vmap <buffer> cc :s/^/\/\//<Esc><Esc>
vmap <buffer> cx :s/\/\/// <Esc><Esc>
nmap <buffer> cc V:s/^/\/\//<Esc><Esc>
nmap <buffer> cx V:s/\/\/// <Esc><Esc>
