#!/bin/bash
cp -r ./.vim/ ~
cp ./.vim/vimrc ~/.vimrc
cp ./.bashrc ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
