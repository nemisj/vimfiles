let b:current_place = escape(expand('%:p:h'), ' ')
let b:syntastic_checkers = ['tslint']
let b:syntastic_typescript_checkers = ['tslint', 'tsc']
let b:tslint_bin = findfile('node_modules/.bin/tslint', b:current_place . ';')
if b:tslint_bin != ''
  let b:syntastic_typescript_tslint_exec = fnamemodify(b:tslint_bin, ':p')
endif
