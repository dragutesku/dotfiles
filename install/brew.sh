# Install Linuxbrew
echo "Add Linuxbrew ✏️";

yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null;

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";

## Update & Upgrade brew
echo "Brew update & upgrade packages";

brew update;
brew upgrade;

## Install packages
echo "Brew install packages";

brew install ag;
brew install cmake;
brew install grep;
brew install httpie;
brew install python;
brew install tmux;
brew install tree;
brew install neovim;
brew install volta;
brew install gcc;
