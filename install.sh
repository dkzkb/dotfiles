#!/bin/sh

set -e
set -u

ROOT=${ROOT:-~/src/github.com/dkzkb/dotfiles}

if [ ! -d "$ROOT" ]; then
    git clone https://github.com/dkzkb/dotfiles.git "$ROOT"
    echo 'git clone'
fi

mkdir -p ~/.zsh

create_link () {
     local _name
     _name=$1

     if [ -e "$HOME/$_name" ]; then
         echo "mv $HOME/$_name $HOME/$name.bak"
         mv "$HOME/$_name" "$HOME/$name.bak"
     fi

     ln -fsv "$ROOT/src/$_name" "$HOME/$_name"
     echo "ln -fsv $ROOT/src/$_name $HOME/$_name"
}

create_link .zsh/.zshrc
create_link .aliases
#create_link .bash_profile
create_link .bashrc
#create_link .vimrc
