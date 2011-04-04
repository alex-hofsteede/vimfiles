
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"set colors and highlighting
let &t_Co=256
set number
syntax on
set background=dark
colorscheme solarized

"set tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set nowrap

"map characters
nmap 0 ^
