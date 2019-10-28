#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null && pwd  )"

cp $DIR/.vimrc ~/.vimrc
cp $DIR/.bashrc ~/.bashrc
cp $DIR/.tmux.conf ~/.tmux.conf

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install plugins
vim -c PluginInstall -c :q -c :q

# What else should I install?
# - vim
# - tmux
# - tmux plugin manager
