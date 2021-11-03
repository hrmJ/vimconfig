vmap <leader>S :<C-U>
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

" this pull request https://github.com/junegunn/fzf.vim/pull/1098 was never
" approved, so these changes to fzf/vim.vim must be added manually

" ------------------------------------------------------------------
" Lines
" ------------------------------------------------------------------
function! s:line_handler2(lines)
  if len(a:lines) < 2
    return
  endif
  let qfl = []
  for line in a:lines[1:]
    let chunks = split(line, "\t", 1)
    let bufnumber = chunks[0]
    let ln = chunks[2]
    let ltxt = join(chunks[3:], "\t")
    call add(qfl, {'filename': bufname(str2nr(bufnumber)), 'lnum': str2nr(ln), 'text': ltxt})
  endfor
  call s:fill_quickfix(qfl, 'cfirst')
  normal! m'
  let cmd = s:action_for(a:lines[0])
  if !empty(cmd) && stridx('edit', cmd) < 0
    execute 'silent' cmd
  endif

  let keys = split(a:lines[1], '\t')
  execute 'buffer' keys[0]
  execute keys[2]
  normal! ^zvzz
endfunction

function! fzf#vim#_lines2(all)
  let cur = []
  let rest = []
  let buf = bufnr('')
  let longest_name = 0
  let display_bufnames = &columns > s:wide
  if display_bufnames
    let bufnames = {}
    for b in s:buflisted()
      let bufnames[b] = pathshorten(fnamemodify(bufname(b), ":~:."))
      let longest_name = max([longest_name, len(bufnames[b])])
    endfor
  endif
  let len_bufnames = min([15, longest_name])
  for b in s:buflisted()
    let lines = getbufline(b, 1, "$")
    if empty(lines)
      let path = fnamemodify(bufname(b), ':p')
      let lines = filereadable(path) ? readfile(path) : []
    endif
    if display_bufnames
      let bufname = bufnames[b]
      if len(bufname) > len_bufnames + 1
        let bufname = '…' . bufname[-len_bufnames+1:]
      endif
      let bufname = printf(s:green("%".len_bufnames."s", "Directory"), bufname)
    else
      let bufname = ''
    endif
    let linefmt = s:blue("%2d\t", "TabLine")."%s".s:yellow("\t%4d ", "LineNr")."\t%s"
    call extend(b == buf ? cur : rest,
    \ filter(
    \   map(lines,
    \       '(!a:all && empty(v:val)) ? "" : printf(linefmt, b, bufname, v:key + 1, v:val)'),
    \   'a:all || !empty(v:val)'))
  endfor
  return [display_bufnames, extend(cur, rest)]
endfunction

function! fzf#vim#lines2(...)
  let [display_bufnames, lines] = fzf#vim#_lines2(1)
  let nth = display_bufnames ? 3 : 2
  let [query, args] = (a:0 && type(a:1) == type('')) ?
        \ [a:1, a:000[1:]] : ['', a:000]
  return s:fzf('lines', {
  \ 'source':  lines,
  \ 'sink*':   s:function('s:line_handler2'),
  \ 'options': s:reverse_list(['+m', '--tiebreak=index', '--multi', '--prompt', 'Lines> ', '--ansi', '--extended', '--nth='.nth.'..', '--tabstop=1', '--query', query])
  \}, args)
endfunction
