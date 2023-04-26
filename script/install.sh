#!/bin/bash

dummy="false"

function log_success {
    printf "\033[0;32m$1\033[0m\n"
}

function log_fail {
    printf "\033[0;31m$1\033[0m\n"
}

echo "Configuring neovim ✏️"

helper_ask_yn "Do you want to configure neovim in $HOME/.config/nvim ?" "dummy"
if test $? -eq 0; then
    log_success "Linking $PWD/.config/nvim -> $HOME/.config/nvim"
    # ln -sf "$PWD/.config/nvim" "$HOME/.config/nvim"
fi

