
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1
let g:ale_fixers_explicit = 1

"let g:ale_php_php_cs_fixer_executable='/home/developer/.composer/vendor/bin/php-cs-fixer'
"let g:ale_php_cs_fixer_executable = '/home/developer/.composer/vendor/bin/php-cs-fixer'
"let g:ale_php_langserver_executable = '/home/developer/.composer/vendor/bin/php-language-server.php'
"let g:ale_php_phan_executable = '/home/developer/.composer/vendor/bin/phan'
"let g:ale_php_phpcs_executable = '/home/developer/.composer/vendor/bin/phpcs'
"let g:ale_php_langserver_use_global = 1 


let g:ale_fixers = {
\   'php': ['prettier', 'php_cs_fixer'],
\}

"let g:ale_linters = {
"\   'php': ['phpcs','phan'],
"\}

let g:ale_fix_on_save = 0
let g:airline#extensions#ale#enabled = 1

" let g:ale_python_pylint_options = '--load-plugins pylint_django'

