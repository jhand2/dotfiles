#!/bin/bash
cp -r ./.vim/ ~
cp ./.vim/vimrc ~/.vimrc
cp ./.bashrc ~/.bashrc

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
