" save when leaving insert mode
autocmd InsertLeave * write


" Prettier for PHP
function PrettierPhpCursor()
  let save_pos = getpos(".")
  %! prettier --stdin --parser=php
  call setpos('.', save_pos)
endfunction
" define custom command
command PrettierPhp call PrettierPhpCursor()
" format on save
" autocmd BufwritePre *.php PrettierPhp
