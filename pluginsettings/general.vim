" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


let g:easy_align_delimiters = {
\ '/': { 'pattern': '#\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment'] }
\ }

"%!quicktype --lang typescript https://swapi.dev/api/species/

