#!/usr/bin/env bash
echo "+++++++++++++++++++install vundle+++++++++++++++++++"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "+++++++++++++++++++install color molokai+++++++++++++++++++"
git clone https://github.com/tomasr/molokai.git
cp -rf molokai/colors ~/.vim
echo "+++++++++++++++++++install vim config .vimrc+++++++++++++++++++"
cp -rf .vimrc ~/
rm -rf mokokai
echo "+++++++++++++++++++use vim enter :BundleInstall+++++++++++++++++++"

