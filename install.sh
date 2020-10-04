  
#!/bin/bash

set -eu

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

mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
ln -fsv "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"

mv "$HOME/.aliases" "$HOME/.aliases.bak"
ln -fsv "$DOTFILES_DIR/.aliases" "$HOME/.aliases"
