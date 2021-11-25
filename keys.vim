vmap <C-l> :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy:<C-R>=&ic?'vimgrep ':'vimgrep '<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '', '', 'g') <CR> %<CR>:Telescope quickfix<CR>

vnoremap <leader>S :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy:<C-R>=&ic?'Rg ':'Rg '<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '', '', 'g')<CR><CR>

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

nnoremap <leader>qt :%!quicktype -l typescript --just-types --top-level MyType<CR>

au FileType markdown vmap <Leader>A :EasyAlign*<Bar><Enter>
