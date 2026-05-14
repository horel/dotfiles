#!/bin/bash

# 恢复 dotfiles
# git clone --bare https://github.com/horel/dotfiles.git $HOME/.dotfiles
# alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
# dotfiles checkout -f
# dotfiles config --local status.showUntrackedFiles no
# sh $HOME/.dotfiles/.config/restore_dotfiles.sh

# 前置依赖
sudo pacman -S flclash paru

# 安装环境依赖
sudo pacman -S --noconfirm --needed \
    fcitx5-im fcitx5-rime rime-ice fcitx5-nord \
    noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-nerd-fonts-symbols ttf-maplemononormalnl-nf-cn-unhinted \
    alacritty zoxide eza \
    neovim xsel words luarocks tree-sitter tree-sitter-cli \

# 安装软件包
sudo pacman -S --noconfirm --needed \
    git-delta curl wget \
    python uv python-neovim \
    clang cmake xmake \
    nodejs pnpm \
    lua lua-language-server \
    flameshot mpv \
    system-config-printer sddm-kcm

# 安装aur软件包
paru -S --noconfirm --needed google-chrome visual-studio-code-bin

# 拉取子模块
dotfiles submodule update --init --recursive
dotfiles submodule update --remote --merge

# 安装 Hugo 0.120.4 扩展版
HUGO_DIR="$HOME/.local/bin"
HUGO_PATH="$HUGO_DIR/hugo_extended_0.120.4_linux-amd64.tar.gz"
mkdir -p "$HUGO_DIR"

echo "正在下载 Hugo 0.120.4 扩展版..."
curl -L "https://github.com/gohugoio/hugo/releases/download/v0.120.4/hugo_extended_0.120.4_linux-amd64.tar.gz" -o "$HUGO_PATH"

echo "正在解压 Hugo 0.120.4 文件..."
tar -xzf "$HUGO_PATH" -C "$HUGO_DIR"
