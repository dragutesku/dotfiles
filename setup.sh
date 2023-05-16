#!/bin/bash

# Get current dotfiles dir
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";


# Package Managers and packages & Simlinks
echo "# Start DOTFILE instalation ✏️";

## Git
## TODO: Fix the gitconfig kinda broken
ln -sfv "$DOTFILES_DIR/shell/git/.gitconfig" ~;
ln -sfv "$DOTFILES_DIR/shell/git/.gitignore_global" ~;
ln -sfv "$DOTFILES_DIR/shell/git/.gitsettings" ~;

## Zsh
if [ $ZSH ]; then
    echo "Linking ZSH file";
    ln -sf "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc";

    ## Check for OhMyZsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing OhMyZsh";
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
    fi
else
    "No .zshrc found, please install zsh first, killing instalation ...";
    exit;
fi

# Package Managers and packages

## Install Linuxbrew
echo "# Package managers & packages ✏️";
if [ ! -d "/home/linuxbrew" ]; then
    echo "Installing linuxbrew ...";
    /bin/bash "$DOTFILES_DIR/install/brew.sh";

    ### Need to lauch brew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";
fi

## Install Volta
if [ -x "$(command brew)" ]; then
    echo "Install Volta";
    /bin/bash "$DOTFILES_DIR/install/volta.sh";
fi

## Nvchad
if [ -x "$(command nvim)" ]; then
    echo "Install Nvchad";
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1;
fi

## Generate SSH
if [ ! -d "/home/dragutesku/.ssh" ]; then
    echo "Generating new ssh";
    /bin/bash "$DOTFILES_DIR/install/ssh.sh";
fi
echo "-----------------------------------------------";

# Cleanup
if [ -f "$HOME/dotfiles/install.sh" ]; then
    echo "Cleaning and relaunchin shell";
    rm -rf ./install.sh;

    ## Relaunch shell
    source $HOME/.zshrc;
fi
