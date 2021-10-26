set nocompatible              " be iMproved, required
filetype off                  " required
"Escape from terminal by ESC
tnoremap <Esc> <C-\><C-n>
set wildignore+=*/node_modules/**,*.swp,*.zip,*/__pycache__/**,*/dist/**

" Add a custom command for quickly opening config
command Config tabnew ~/.config/nvim/init.vim
command Plugins tabnew ~/.config/nvim/plugins.vim

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/generalsettings.vim
source $HOME/.config/nvim/misc.vim
source $HOME/.config/nvim/pluginsettings/ultisnips.vim
source $HOME/.config/nvim/pluginsettings/mkpreview.vim
source $HOME/.config/nvim/pluginsettings/jsdoc.vim
source $HOME/.config/nvim/pluginsettings/fzf.vim
source $HOME/.config/nvim/pluginsettings/ale.vim
source $HOME/.config/nvim/pluginsettings/vim-test.vim
source $HOME/.config/nvim/pluginsettings/coc.vim
source $HOME/.config/nvim/pluginsettings/nerdtree.vim
source $HOME/.config/nvim/pluginsettings/airline.vim
source $HOME/.config/nvim/pluginsettings/vim-javascript.vim
source $HOME/.config/nvim/pluginsettings/prettier.vim
source $HOME/.config/nvim/pluginsettings/phpdoc.vim
source $HOME/.config/nvim/pluginsettings/taglist.vim
source $HOME/.config/nvim/pluginsettings/ctrlspace.vim
source $HOME/.config/nvim/pluginsettings/mkdx.vim
source $HOME/.config/nvim/pluginsettings/general.vim
source $HOME/.config/nvim/themes/codedark.vim
