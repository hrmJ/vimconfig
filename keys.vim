
" Remap leader key to ,
let g:mapleader=','

noremap <C-s> :update<CR>

imap <C-l> <Plug>(coc-snippets-expand)

" testing

nmap <silent> t<C-n> :silent! TestNearest<CR>
nmap <silent> t<C-f> :silent! TestFile<CR>
nmap <silent> t<C-s> :silent! TestSuite<CR>
nmap <silent> t<C-l> :silent! TestLast<CR>
nmap <silent> t<C-g> :silent! TestVisit<CR>

" fzf
nnoremap <C-p> :Files<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>l :Lines<CR>



" https://github.com/ctaylo21/jarvis/blob/master/config/nvim/init.vim
" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" === Denite shorcuts === "

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
" nmap <leader>f :NERDTreeFind<CR>

"   <Space> - PageDown
"   -       - PageUp
" noremap <Space> <PageDown>
" noremap - <PageUp>

" === coc.nvim === "
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>t  <Plug>(coc-format-selected)
nmap <leader><space> <Plug>(coc-format)
" coc.git
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)


" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
" map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>w <Plug>(easymotion-bd-w)


" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP
