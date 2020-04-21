call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
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
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish'
Plug 'Olical/vim-enmasse'
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
Plug 'eliba2/vim-node-inspect'
"typescript + react
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-cucumber'




" vim's look  and interface
Plug 'vim-airline/vim-airline'
Plug 'tomasiser/vim-code-dark'
" git:
Plug 'tpope/vim-fugitive'
" Other / system
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-unimpaired'

" php  / laravel
Plug 'Rican7/php-doc-modded'
Plug 'tobyS/vmustache'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'noahfrederick/vim-composer'
Plug 'noahfrederick/vim-laravel'
Plug 'jwalton512/vim-blade'
Plug 'tpope/vim-eunuch'
Plug 'joereynolds/SQHell.vim'

Plug 'chr4/nginx.vim'

"Plug 'MrAlejandro/vim-phpdoc'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [  'php' ] }


"tmux: for testing

Plug 'jgdavey/tslime.vim'


call plug#end()
