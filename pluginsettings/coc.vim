let g:coc_global_extensions = [
    	\'coc-emmet',
    	\'coc-eslint',
    	\'coc-git',
    	\'coc-json',
    	\'coc-lists',
    	\'coc-marketplace',
    	\'coc-phpls',
    	\'coc-post',
    	\'coc-prettier',
    	\'coc-snippets',
    	\'coc-todolist',
    	\'coc-tsserver',
    	\'coc-vetur',
    	\'coc-webpack',
    	\'coc-yank',
    	\'https://github.com/onecentlin/laravel5-snippets-vscode',
    	\'https://github.com/xabikos/vscode-react',
    	\'https://github.com/andys8/vscode-jest-snippets',
			\]



command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent> gh :call <SID>show_documentation()<CR>
" List errors
nnoremap <silent> <leader>cl  :<C-u>CocList locationlist<cr>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Git
"
nnoremap <silent> <leader>cu  :<C-u>CocCommand git.chunkUndo<cr>

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction



"JEST


" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')


"Yanklist
"
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


"https://gitter.im/neoclide/coc.nvim?at=5e013bebc0c8ef301b01ff69

function! FloatScroll(forward) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  if a:forward
    if pos[0] == 1
      let pos[0] += 3 * win_height / 4
    elseif pos[0] + win_height / 2 + 1 < buf_height
      let pos[0] += win_height / 2 + 1
    else
      let pos[0] = buf_height
    endif
  else
    if pos[0] == buf_height
      let pos[0] -= 3 * win_height / 4
    elseif pos[0] - win_height / 2 + 1  > 1
      let pos[0] -= win_height / 2 + 1
    else
      let pos[0] = 1
    endif
  endif
  call nvim_win_set_cursor(float, pos)
  return ''
endfunction

inoremap <silent><expr> <down> coc#util#has_float() ? FloatScroll(1) : "<down>"
inoremap <silent><expr>  <up>  coc#util#has_float() ? FloatScroll(0) :  "<up>"
