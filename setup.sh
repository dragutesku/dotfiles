#!/bin/bash

# Get current dotfiles dir
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# Package Managers and packages & Simlinks
echo "# Symlink Instalation ✏️"
## Git
## TODO: Fix the gitconfig kinda broken
ln -sfv "$DOTFILES_DIR/shell/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/shell/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/shell/git/.gitsettings" ~

## Zsh
if [ -f "$HOME/.zshrc" ]; then
    echo "Linking ZSH file"
    ln -sf "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc"
    echo "Installing OhMyZsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    "No ZSHFILE found, killing the script ..."
    exit
fi
echo "-----------------------------------------------"

# Package Managers and packages

# Install Linuxbrew
echo "# Package managers & packages ✏️"
if [ ! -d "/home/linuxbrew" ]; then
    echo "Installing linuxbrew ..."
    /bin/bash "$DOTFILES_DIR/install/brew.sh"
    source ~/.zshrc
fi

# Install Volta
if [ -d "/home/linuxbrew" ]; then
    echo "Install Volta"
    /bin/bash "$DOTFILES_DIR/install/volta.sh"
fi
# Nvchad
if [ -d "/home/linuxbrew/.linuxbrew/Cellar/neovim" ]; then
    echo "Install Nvchad"
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
fi

# Generate SSH
if [ ! -d "/home/dragutesku/.ssh" ]; then
    echo "Generating new ssh"
    /bin/bash "$DOTFILES_DIR/install/ssh.sh"
fi
echo "-----------------------------------------------"

#Cleanup
rm -rf ./install.sh

# Relaunch shell
source ~/.zshrc
