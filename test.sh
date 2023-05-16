if [ -x "$(command -v nvim)" ] && [ ! -d "$HOME/.config/nvim" ]; then
    echo "Install Nvchad";
else
    echo "Nvim already has a configuration moving on ...";
fi
