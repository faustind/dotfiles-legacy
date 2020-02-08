call plug#begin('~/.vim/plugged')

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'scrooloose/nerdtree'

Plug 'neovimhaskell/haskell-vim'

Plug 'flazz/vim-colorschemes'

Plug 'itchyny/vim-gitbranch'

Plug 'itchyny/lightline.vim'
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

    colorscheme desert

    function! LightlineFileformat()
          return winwidth(0) > 70 ? &fileformat : ''
    endfunction

    function! LightlineFileencoding()
            return winwidth(0) > 70 ? &fileencoding : ''
    endfunction

    " Don't show the mode in the status line when this is loaded
    set noshowmode

Plug 'arcticicestudio/nord-vim'

" Plugin 'Valloric/YouCompleteMe'
"    let g:ycm_autoclose_preview_window_after_insertion = 1
"    let g:ycm_autoclose_preview_window_after_completion = 1

Plug 'jpalardy/vim-slime'
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1

Plug 'posva/vim-vue'

Plug 'tpope/vim-surround'

Plug 'mattn/emmet-vim'

Plug 'nanotech/jellybeans.vim'

Plug 'vim-syntastic/syntastic'
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

	let g:syntastic_python_checkers = ['flake8']

    let g:syntastic_javascript_checkers = ['eslint']
    let g:syntastic_javascript_eslint_exe = 'npm run lint --'
"    let g:syntastic_javascript_checkers_exec = '$(npm bin)/eslint'

    let g:syntastic_vue_checkers = ['eslint']
    let g:syntastic_vue_eslint_exe = 'npm run lint --'
"   let g:syntastic_vue_checkers_exec = '$(npm bin)/eslint'

Plug 'rust-lang/rust.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call plug#end()            " required
