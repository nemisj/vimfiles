setlocal tabstop=2
setlocal softtabstop=2 " makes the spaces feel like real tabs
setlocal shiftwidth=2
setlocal expandtab
let g:jsx_ext_required = 0

" Still no Align plugin
" preserv space when doing Align=|:
" autocmd FileType javascript AlignCtrl W

let b:ale_fixers = ['prettier', 'eslint']
