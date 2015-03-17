" Manually infect plugin
let s:plugin = expand('<sfile>:p:h')
exe 'set runtimepath+=' . s:plugin . '/'
exe 'runtime!' s:plugin '/plugin/*.vim'
