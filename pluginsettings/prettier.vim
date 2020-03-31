" Manual prettier config:


autocmd FileType php let b:prettier_ft_default_args = {
  \ 'parser': 'php',
  \ }

let g:prettier#config#config_precedence = 'file-override'
let g:prettier#exec_cmd_async = 1
"let g:prettier#exec_cmd_path = "/home/juho/.nvm/versions/node/v10.16.3/bin/prettier"
let g:prettier#exec_cmd_path = "/home/juho/.npm-global/bin/prettier"

