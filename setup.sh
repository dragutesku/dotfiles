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

# Zsh
## Get rid of old zshrc file
if [ -f "$HOME/.zshrc" ]; then
    echo "remove current zsh file";
    rm -rf $HOME/.zshrc;    
fi

## Check for OhMyZsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing OhMyZsh";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
fi

## Create new zshrc
echo "Creating ZSHRC a file from the goodness of my heart ...";
touch $HOME/.zshrc;

## Link it to what we have in config
echo "Linking ZSH file";
ln -sf "$DOTFILES_DIR/shell/zsh/.zshrc" "$HOME/.zshrc";

# Package Managers and packages
## Install Linuxbrew
echo "# Package managers & packages ✏️";
if [ ! -d "/home/linuxbrew" ]; then
    echo "Installing linuxbrew ...";
    /bin/bash "$DOTFILES_DIR/install/brew.sh";
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";
else
    echo "Linuxbrew already here !";
fi

## Somehow need rerun brew
##TODO: if this works need to fix this later
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

## Install Volta
if [ -x "$(command -v brew)" ]; then
    echo "Install Volta and all necessary packages";
    /bin/bash "$DOTFILES_DIR/install/volta.sh";
fi

## Install Npm packages
if [ -x "$(command -v volta)" ]; then
    echo "Temporary add NODE & NPM to path";
    eval "$(/home/$USER/.volta/bin/node shellenv)";
    eval "$(/home/$USER/.volta/bin/npm shellenv)";

    echo "Start NPM package installer";
    /bin/bash "$DOTFILES_DIR/install/npm.sh";
else 
    echo "Volta command no workie";
fi

## Nvchad
if [ ! -d "$HOME/.config/nvim" ] && [ -x "$(command -v nvim)" ]; then
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
echo "Instalation finished restart shell or die trying ...";

cd ~
source $HOME/.zshrc;
