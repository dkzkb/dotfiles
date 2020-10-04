  
#!/bin/bash

set -e
set -u

DOTFILES_DIR=$HOME/dotfiles/src

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/dkzkb/dotfiles.git
else
    echo "$DOTFILES_DIR already downloaded. Updating..."
    cd "$DOTFILES_DIR"
    git stash
    git checkout main
    git fetch --prune origin main
    git pull origin main
    echo
fi

testfunc () {
    echo 'test'
}

cd "$DOTFILES_DIR"
pwd

test -e "$HOME/.aliases" && mv "$HOME/.aliases" "$HOME/.aliases.bak"
ln -sf "$DOTFILES_DIR/.aliases" "$HOME/.aliases"

test -e "$HOME/.bashrc" && mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
