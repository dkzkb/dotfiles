  
#!/bin/bash

set -e
set -u

# 実行場所のディレクトリを取得
DOTFILES_DIR=$HOME/dotfiles

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone https://github.com/dkzkb/dotfiles.git "$DOTFILES_DIR"
else
    echo "$DOTFILES_DIR already downloaded. Updating..."
    cd "$DOTFILES_DIR"
    git stash
    git checkout main
    git fetch --prune origin main
    git pull origin main
    echo
fi

cd "$DOTFILES_DIR"

test -e "$HOME/.aliases" && mv "$HOME/.aliases" "$HOME/.aliases.bak"
ln -fsv "$DOTFILES_DIR/src/.aliases" "$HOME/.aliases"

test -e "$HOME/.bashrc" || mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
ln -fsv "$DOTFILES_DIR/src/.bashrc" "$HOME/.bashrc"
