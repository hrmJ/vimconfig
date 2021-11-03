vmap <leader>S :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy:<C-R>=&ic?'Rg ':'Rg '<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '', '', 'g')<CR><CR>
