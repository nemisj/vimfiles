setlocal tabstop=2
setlocal softtabstop=2 " makes the spaces feel like real tabs
setlocal shiftwidth=2
setlocal expandtab

" Still no Align plugin
" preserv space when doing Align=|:
" autocmd FileType javascript AlignCtrl W

" Comment lines by using cc
" Uncomment lines by using cx
vmap <buffer> cc :s/^/\/\//<Esc><Esc>
vmap <buffer> cx :s/\/\/// <Esc><Esc>
nmap <buffer> cc V:s/^/\/\//<Esc><Esc>
nmap <buffer> cx V:s/\/\/// <Esc><Esc>
