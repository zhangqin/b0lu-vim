syntax enable
syntax on
set nu
set t_Co=256
set background=dark
colorscheme molokai

set cul "高亮光标所在行"
set shiftwidth=4
set tabstop=4
set expandtab
set number
set autoread
set showcmd
set autoindent
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set shell=/bin/bash
set nocompatible
set noshowmode
set backspace=indent,eol,start
filetype on
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'jiangmiao/auto-pairs'
Bundle 'davidhalter/jedi-vim' 
Bundle 'majutsushi/tagbar'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'bling/vim-airline'
Bundle "scrooloose/nerdtree"
Bundle "vim-scripts/noerrmsg.vim"
Bundle 'JazzCore/neocomplcache-ultisnips'
Bundle "Shougo/neocomplete.vim"
Bundle 'fatih/vim-go'

"autocmd VimEnter * nested :TagbarOpen
"autocmd VimEnter * nested :NERDTreeFind
"autocmd VimEnter * nested :NERDTreeFocusToggle

"autocmd vimenter * NERDTree 
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)


let g:neocomplete#enable_at_startup = 1

let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 0
let g:clang_use_library = 1
let g:clang_debug = 1
let g:clang_library_path = '/usr/lib/'
"let g:clang_user_options='|| exit 0'
" YouCompleteMe plugin
set completeopt+=preview
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:neocomplete#enable_at_startup = 1

"let g:airline_theme = 'badwolf'
"let g:airline_powerline_fonts = 1


"let g:nerdtree_tabs_smart_startup_focus = 2
"let g:nerdtree_tabs_open_on_console_startup = 1
"let g:nerdtree_tabs_focus_on_files = 1
"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

map <F5> :call CompileRun()<CR>
map <F2> :tabnew
map <F3> :tabprevious<CR>
map <F4> :tabnext<CR>
nmap tt :%s/\t/    /g<CR>
nmap <F8> :TagbarToggle<CR>

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
    elseif &filetype == 'go'
        :!time go run  %
    endif
endfunc
 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py,*.js,*.go exec ":call SetTitle()" 
func SetTitle() 
    if &filetype == 'sh' 
        call setline(1,"\#!/usr/bin/env bash") 
        call append(line("."),"# coding=utf-8")                                        
        call append(line(".")+1,"# author: b0lu")                                            
        call append(line(".")+2,"# mail: b0lu_xyz@163.com")                                             
        call append(line(".")+3, "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")                                            
        call append(line("."),"# coding=utf-8")                                        
        call append(line(".")+1,"# author: b0lu")                                            
        call append(line(".")+2,"# mail: b0lu_xyz@163.com")                                             
        call append(line(".")+3, "")   
    elseif &filetype == 'js'
        call setline(1,"/*")
        call append(line("."),"*author: b0lu")
        call append(line(".")+1,"*mail: b0lu_xyz@163.com")
        call append(line(".")+2,"*/")
        call append(line(".")+3, "")    
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")                                        
        call append(line(".")+1,"# author: b0lu")                                            
        call append(line(".")+2,"# mail: b0lu_xyz@163.com")                                             
        call append(line(".")+3, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author: b0lu") 
        call append(line(".")+2, "    > Mail: b0lu_xyz@163.com") 
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
endfunc 
autocmd BufNewFile * normal G

