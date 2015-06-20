#!/usr/bin/env bash
echo "install vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "install color molokai"
git clone https://github.com/tomasr/molokai.git
mv molokai/colors ~/.vim
echo "install vim config .vimrc"
mv .vimrc ~/

