setlocal tabstop=4
setlocal softtabstop=4 " makes the spaces feel like real tabs
setlocal shiftwidth=4

" Still no Align plugin
" preserv space when doing Align=|:
" autocmd FileType javascript AlignCtrl W

" Comment lines by using cc
" Uncomment lines by using cx
vmap <buffer> cc :s/^/\/\//<Esc><Esc>
vmap <buffer> cx :s/\/\/// <Esc><Esc>

