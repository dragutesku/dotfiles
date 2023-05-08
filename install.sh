#!/bin/bash

# Get current dotfiles dir
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


echo "# Symlink Instalation ✏️"
## Git
ln -sfv "$DOTFILES_DIR/shell/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/shell/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/shell/git/.gitsettings" ~
## Zsh
ln -sf "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc"
echo "-----------------------------------------------"

echo "# Package managers & packages ✏️"
. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/volta.sh"
echo "-----------------------------------------------"

# Install NvChad
echo "# NvChad ✏️"
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
echo "-----------------------------------------------"

