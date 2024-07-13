#!/bin/sh

echo Removing previous configuration
[ -f ~/.vimrc  ] && rm    ~/.vimrc
[ -f ~/.gvimrc ] && rm    ~/.gvimrc
[ -d ~/.vim    ] && rm -r ~/.vim

echo Copying vim configuration
cp -a vim ~/.vim

echo Copying tig configuration
cp tigrc ~/.tigrc

echo Copying tmux configuration ...
cp -a tmux.conf ~/.tmux.conf
