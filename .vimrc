syntax enable
syntax on
set nu
set t_Co=256
set background=dark
colorscheme molokai

set shiftwidth=4
set tabstop=4
set expandtab
set number
set autoread
set showcmd
set autoindent
set shell=/bin/bash
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'jiangmiao/auto-pairs'
Bundle 'davidhalter/jedi-vim' 
"Bundle 'Valloric/YouCompleteMe'

map <F5> :call CompileRun()<CR>
map <F2> :tabnew
map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'python'
        exec "!time python %"
    endif
endfunc
