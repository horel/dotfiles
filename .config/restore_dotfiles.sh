#!/bin/bash

git clone --bare https://github.com/horel/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
dotfiles checkout -f
dotfiles config --local status.showUntrackedFiles no
