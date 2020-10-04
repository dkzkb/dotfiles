  
#!/bin/bash

set -eu

# 実行場所のディレクトリを取得
THIS_DIR=$HOME/dotfiles

if [ ! -d "$THIS_DIR" ]; then
    git clone https://github.com/dkzkb/dotfiles.git "$THIS_DIR"
else
    echo "$THIS_DIR already downloaded. Updating..."
    cd "$THIS_DIR"
    git stash
    git checkout main
    git fetch --prune origin main
    git pull origin main
    echo
fi
