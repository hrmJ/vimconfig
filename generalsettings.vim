
set ttimeout
set ttimeoutlen=100

set number
set relativenumber
" ===============================================================
" ===============================================================

set ignorecase
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Don't show last command
set noshowcmd
" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
"set expandtab
" Insert TABS when TAB is pressed.
set noexpandtab
set tabstop=2
" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2
" Indentation amount for < and > commands.
set shiftwidth=2
" do not wrap long lines by default
set nowrap
" Don't highlight current cursor line
set nocursorline
" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler
" Only one line for command line
set cmdheight=1
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c
"split to right by default

set splitright

" Syntax highlighting: slow, but correct:

autocmd BufEnter * :syntax sync fromstart

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" RG search for selected text
vmap <leader>s :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy:<C-R>=&ic?'Rg ':'Rg '<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '', '', 'g')<CR><CR>


" Set backups
"if has('persistent_undo')
"  set undofile
"  set undolevels=3000
"  set undoreload=10000
"endif
"set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
"set backup
"set noswapfile



" Reload icons after init source
" if exists('g:loaded_webdevicons')
"   call webdevicons#refresh()
" endif
