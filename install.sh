#!/bin/sh

echo Copying vimrc ...
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc

echo Copying vimfiles ...
[ -d ~/.vim ] && rm -r ~/.vim
cp -a vim ~/.vim
