#!/bin/bash

# Get current dotfiles dir
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# Package Managers and packages & Simlinks
echo "# Start DOTFILE instalation ✏️";

## Git
## TODO: Fix the gitconfig kinda broken
ln -sfv "$DOTFILES_DIR/shell/git/.gitconfig" ~;
ln -sfv "$DOTFILES_DIR/shell/git/.gitignore_global" ~;
ln -sfv "$DOTFILES_DIR/shell/git/.gitsettings" ~;

## Zsh
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Creating ZSHRC a file from the goodness of my heart ...";
    touch $HOME/.zshrc
fi

echo "Linking ZSH file";
ln -sf "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc";

## Check for OhMyZsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing OhMyZsh";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

# Package Managers and packages

## Install Linuxbrew
echo "# Package managers & packages ✏️";
if [ ! -d "/home/linuxbrew" ]; then
    echo "Installing linuxbrew ...";
    /bin/bash "$DOTFILES_DIR/install/brew.sh";
fi

## Install Volta
if [ -x "$(command brew -v)" ]; then
    echo "Install Volta and all necessary packages";
    /bin/bash "$DOTFILES_DIR/install/volta.sh";
fi

## Nvchad
if [ -x "$(command nvim -v)" -a ! -d "$HOME/.config/nvim" ]; then
    echo "Install Nvchad";
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1;
else
    echo "Nvim already has a configuration moving on ...";
fi

## Generate SSH
if [ ! -d "$HOME/.ssh" ]; then
    echo "Generating new ssh";
    /bin/bash "$DOTFILES_DIR/install/ssh.sh";
else 
    echo "SSH already heare moving on ...";
fi
echo "-----------------------------------------------";

## Cleanup
if [ -f "$HOME/dotfiles/install.sh" ]; then
    echo "Cleaning and relaunchin shell";
    rm -rf ./install.sh;
else
    echo "No cleaning needed ...";
fi

## Relaunch shell
echo "Instalation finished restarting shell ...";
source $HOME/.zshrc;
