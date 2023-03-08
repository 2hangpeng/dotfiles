#!/bin/bash

# Determine the operating system
if [ "$(uname)" == "Darwin" ]; then
  # macOS

  # Install Homebrew if not installed
  if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
    for tap in core cask{,-fonts,-drivers,-versions} command-not-found; do
      brew tap --custom-remote --force-auto-update "homebrew/${tap}" "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
    done
  fi

  # Update Homebrew and install necessary packages
  brew update
  brew install git fish

elif [ "$(uname)" == "Linux" ]; then
  # Ubuntu

  # Update package manager
  apt-get update
  apt-get upgrade

  # Install necessary packages
  apt-get install -y git fish
fi

# Set Fish as the default shell
if [ "$SHELL" != "$(which fish)" ]; then
  echo "Setting Fish as the default shell"
  chsh -s "$(which fish)"
fi

# Clone dotfiles repository
git clone https://github.com/gh-zhangpeng/dotfiles.git $HOME/dotfiles
