set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'scrooloose/nerdtree.git'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'altercation/vim-colors-solarized.git'

Plugin 'itchyny/vim-gitbranch.git'

Plugin 'itchyny/lightline.vim'
    let g:lightline = { 
                \ 'colorscheme' : 'powerline',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
                \   'right': [ [ 'lineinfo' ],
                \              [ 'percent' ],
                \              [ 'fileformat', 'fileencoding' ] ]
                \ },
                \ 'component_function': {
                \   'gitbranch': 'gitbranch#name',
                \   'fileformat': 'LightlineFileformat',
                \   'fileencoding': 'LightlineFileencoding'
                \ },
                \ }

    function! LightlineFileformat()
          return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightlineFileencoding()
            return winwidth(0) > 70 ? &fileencoding : ''
    endfunction

    " Don't show the mode in the status line when this is loaded
    set noshowmode

Plugin 'arcticicestudio/nord-vim'

Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1

Plugin 'jpalardy/vim-slime'
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1

Plugin 'posva/vim-vue'

Plugin 'tpope/vim-surround'

Plugin 'mattn/emmet-vim'
"""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()            " required


