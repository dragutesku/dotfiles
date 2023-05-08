# Install Linuxbrew
echo "Add Linuxbrew ✏️"
curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
/bin/bash install.sh
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew update
brew upgrade

# Install packages
apps=(
    ag
    cmake
    grep
    httpie
    python
    tmux
    tree
    neovim
    volta
)

brew install "${apps[@]}"
