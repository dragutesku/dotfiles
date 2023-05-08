# Install Linuxbrew
echo "Add Linuxbrew ✏️"
sh -c "$(curl -fsSL -o install.sh https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew update
brew upgrade

# Install packages
brew install ag 
brew install cmake
brew install grep
brew install httpie
brew install python
brew install tmux
brew install tree
brew install neovim
brew install volta
brew install gcc
