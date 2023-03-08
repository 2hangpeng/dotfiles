#!/bin/bash

# Determine the operating system
if [ "$(uname)" == "Darwin" ]; then
    # macOS

    # Install Homebrew if not installed
    if ! command -v brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # Update Homebrew and install necessary packages
    brew update
    brew install git

elif [ "$(uname)" == "Linux" ]; then
    # Ubuntu

    # Update package manager
    sudo apt-get update

    # Install necessary packages
    sudo apt-get install -y git
fi

# Clone dotfiles repository
git clone https://github.com/gh-zhangpeng/dotfiles.git $HOME/ttt/dotfiles

