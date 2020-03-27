" sourcing configuration from .vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" enable python3 support
let g:python3_host_prog = '/usr/bin/python3'

" disable python2 support
let g:python_host_prog = 0 

