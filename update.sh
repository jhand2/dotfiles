#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null && pwd  )"

cp ~/.vimrc/ $DIR/.vimrc
cp ~/.tmux.conf $DIR/.tmux.conf
cp ~/.bashrc $DIR/.bashrc

# Commits and pushes dotfiles repo
git -C $DIR add -A
git -C $DIR commit
git -C $DIR push origin master
