setlocal omnifunc=pythoncomplete#Complete
setlocal expandtab
setlocal textwidth=79
setlocal tabstop=8
setlocal softtabstop=4 " makes the spaces feel like real tabs
setlocal shiftwidth=4
setlocal autoindent

" Comment lines by using cc
" Uncomment lines by using cx
vmap <buffer> cc :s/^/#/<Esc><Esc>
vmap <buffer> cx :s/#// <Esc><Esc>
