
"set filetype on before filetype off to avoid exit status of 1. see: http://tooky.github.com/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
filetype on 
filetype plugin indent on
"filetype off 
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
"set tabstop=4
"set shiftwidth=4
set expandtab
set ruler
set nowrap

"map characters
nmap 0 ^
"single char deletes not copied to register
noremap x "_x

"arrow keys do something useful. Note [e and ]e are from unimpaired plugin
"nmap <Left> <<
"nmap <Right> >>
"nmap <Up> [e
"nmap <Down> ]e

"vmap <Left> <gv
"vmap <Right> >gv
"vmap <Up> [egv
"vmap <Down> ]egv

nmap <Left> <Nop>
nmap <Right> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>

vmap <Left> <Nop>
vmap <Right> <Nop>
vmap <Up> <Nop>
vmap <Down> <Nop>
