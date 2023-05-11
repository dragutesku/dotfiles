#!/bin/bash

# Get current dotfiles dir
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Simlinks
echo "# Symlink Instalation ✏️"
## Git
ln -sfv "$DOTFILES_DIR/shell/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/shell/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/shell/git/.gitsettings" ~
## Zsh
ln -sf "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc"
echo "-----------------------------------------------"

# Package Managers and packages
echo "# Package managers & packages ✏️"
/bin/bash "$DOTFILES_DIR/install/brew.sh"
/bin/bash "$DOTFILES_DIR/install/volta.sh"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash "$DOTFILES_DIR/install/ssh.sh"
echo "-----------------------------------------------"

#Cleanup
rm -rf ./install.sh

# Relaunch shell
source ~/.zshrc
