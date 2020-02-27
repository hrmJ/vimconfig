
call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" file navigation 
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" moving / typing
Plug 'justinmk/vim-sneak' " (map s to 2-char quick search)
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate' " (Automatically close brackets etc)
Plug 'easymotion/vim-easymotion'
" search 
Plug 'vim-scripts/sherlock.vim'
Plug 'wincent/ferret'
" javascript / webdev
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Galooshi/vim-import-js'
Plug 'mattn/emmet-vim'
Plug 'janko/vim-test'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'heavenshell/vim-jsdoc'
" vim's look  and interface
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
Plug 'jlanzarotta/bufexplorer'
" git:
Plug 'tpope/vim-fugitive'
" Other / system
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'

" php 
Plug 'Rican7/php-doc-modded'
Plug 'tobyS/vmustache'
"Plug 'MrAlejandro/vim-phpdoc'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [  'php' ] }


call plug#end()
