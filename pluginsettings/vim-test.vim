let test#python#runner = 'pyunit'
let test#php#phpunit#options = '--stderr -d memory_limit=-1'
let test#dusk#runner = 'dusk'
let test#strategy = "neovim"
let test#neovim#term_position = "vert botright"
"let test#python#djangotest#executable = 'foreman run rspec'
let test#strategy = "tslime"
let g:test#echo_command = 0

