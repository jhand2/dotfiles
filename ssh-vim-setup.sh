#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null && pwd  )"

cp $DIR/.vim/.vimrc ~/.vimrc
cp $DIR/.bashrc ~/.bashrc
