#!/bin/sh

echo Copying vim configuration
cp vimrc ~/.vimrc
cp gvimrc ~/.gvimrc
[ -d ~/.vim ] && rm -r ~/.vim
cp -a vim ~/.vim

echo Copying tig configuration
cp tigrc ~/.tigrc

echo Copying tmux configuration ...
cp -a tmux.conf ~/.tmux.conf
