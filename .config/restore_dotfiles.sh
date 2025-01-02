#!/bin/bash

# git clone --bare https://github.com/horel/dotfiles.git $HOME/.dotfiles
# alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
# dotfiles checkout -f
# dotfiles config --local status.showUntrackedFiles no

# 设置目标目录
TARGET_DIR="$HOME/.local/bin"
TARGET_PATH="$TARGET_DIR/hugo_extended_0.120.4_linux-amd64.tar.gz"

# 下载文件
echo "正在下载 Hugo 扩展版..."
curl -L "https://github.com/gohugoio/hugo/releases/download/v0.120.4/hugo_extended_0.120.4_linux-amd64.tar.gz" -o "$TARGET_PATH"

# 解压文件
echo "正在解压文件..."
tar -xzf "$TARGET_PATH" -C "$TARGET_DIR"
