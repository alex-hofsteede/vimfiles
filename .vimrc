set bs=indent,eol,start

"set filetype on before filetype off to avoid exit status of 1. see: http://tooky.github.com/2010/04/08/there-was-a-problem-with-the-editor-vi-git-on-mac-os-x.html
filetype on 
filetype plugin on
filetype plugin indent on
"filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"set colors and highlighting
let &t_Co=256
set number
syntax enable
set background=light
colorscheme solarized

set hlsearch

"set tabs
set smartindent
"set tabstop=4
"set shiftwidth=4
set expandtab
set ruler
set nowrap
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set shellcmdflag=-ic

"use tags file in home dir
set tags=~/tags

"map characters
nmap 0 ^
"single char deletes not copied to register
noremap x "_x

"fit for broken crontab -e
set backupskip=/tmp/*,/private/tmp/*

"arrow keys do something useful. Note [e and ]e are from unimpaired plugin
"nmap <Left> <<
"nmap <Right> >>
"nmap <Up> [e
"nmap <Down> ]e

"vmap <Left> <gv
"vmap <Right> >gv
"vmap <Up> [egv
"vmap <Down> ]egv

nnoremap <M-h> i
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

nmap <Left> <Nop>
nmap <Right> <Nop>
nmap <Up> <Nop>
nmap <Down> <Nop>

vmap <Left> <Nop>
vmap <Right> <Nop>
vmap <Up> <Nop>
vmap <Down> <Nop>

let g:syntastic_cpp_compiler='clang'
let g:syntastic_cpp_compiler_options='-std=c++0x'
let g:syntastic_c_include_dirs=['../..']
let g:syntastic_python_flake8_args='--ignore=E261,E302,E501,E226'
let g:syntastic_python_pylint_args='--errors-only'

"Enter in normal mode inserts a line
nnoremap <CR> o<Esc>
"Stop that interfering with other modes
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

"Scrolling
"set mouse=nicr

"Golang
let g:go_fmt_command = "goimports"
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>
