call plug#begin('~/.vim/plugged')

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-css',
      \ 'coc-cssmodules',
      \ 'coc-html',
      \ 'coc-markdownlint',
      \ 'coc-python',
      \ 'coc-template',
      \ 'coc-vetur',
      \ 'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint', 
      \ 'coc-prettier', 
      \ 'coc-json', 
      \ ]

Plug 'scrooloose/nerdtree'
    let g:NERDTreeIgnore = ['^node_modules$']
    let g:NERDTreeGitStatusWithFlags = 1

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'

Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdcommenter'
    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDTrimTrailingWhitespace = 1

Plug 'neovimhaskell/haskell-vim'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \}

Plug 'flazz/vim-colorschemes'

Plug 'christoomey/vim-tmux-navigator'
"Plug 'itchyny/vim-gitbranch'

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

Plug 'jpalardy/vim-slime'
    let g:slime_target = "tmux"
    let g:slime_python_ipython = 1


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


function! LightlineFileformat()
      return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFileencoding()
        return winwidth(0) > 70 ? &fileencoding : ''
endfunction

" Don't show the mode in the status line when this is loaded
set noshowmode

" Sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
