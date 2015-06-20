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
"将tab替换为空格
nmap tt :%s/\t/    /g<CR>

func! CompileRun()
    exec "w"
    if &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/usr/bin/env bash") 
        call append(line("."),"# coding=utf-8")                                        
        call append(line(".")+1,"# author: b0lu")                                            
        call append(line(".")+2,"# mail: b0lu@163.com")                                             
        call append(line(".")+3, "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")                                            
        call append(line("."),"# coding=utf-8")                                        
        call append(line(".")+1,"# author: b0lu")                                            
        call append(line(".")+2,"# mail: b0lu@163.com")                                             
        call append(line(".")+3, "")   
        
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")                                        
        call append(line(".")+1,"# author: b0lu")                                            
        call append(line(".")+2,"# mail: b0lu@163.com")                                             
        call append(line(".")+3, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: b0lu") 
        call append(line(".")+2, "    > Mail: b0lu@163.com") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G

