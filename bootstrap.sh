#!/bin/bash

# Exit immediately if any command exits with a non-zero status
set -e

# Determine the operating system
case "$(uname -s)" in
Darwin*)
  # macOS

  # Install Homebrew if not installed
  if ! command -v brew >/dev/null 2>&1; then
    sudo echo "Homebrew is not found. Installing Homebrew..."
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"          # put your Git mirror of Homebrew/brew here
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git" # put your Git mirror of Homebrew/homebrew-core here
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # yes "" | INTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
  fi

  # Update Homebrew and install necessary packages
  echo "Updating Homebrew and installing necessary packages..."
  brew update
  brew install git fish neovim
  ;;

Linux*)
  # Ubuntu
  # Disable interactive mode
  export DEBIAN_FRONTEND=noninteractive

  # Update package manager
  sudo add-apt-repository ppa:fish-shell/release-3 -y
  sudo apt-get update

  # Install necessary packages
  echo "Installing necessary packages..."
  sudo apt-get install -y git fish
  ;;

*)
  echo "Unsupported operating system. Please switch to macOS or Ubuntu."
  exit 1
  ;;
esac

# Set Fish as the default shell
if [ "$SHELL" != "$(which fish)" ]; then
  echo "Setting Fish as the default shell..."
  sudo chsh -s "$(which fish)"
  $(which fish)
fi

# Clone dotfiles repository
echo "Cloning dotfiles repository..."
mkdir -p "$HOME/dotfiles"
git clone --depth 1 https://github.com/gh-zhangpeng/dotfiles.git "$HOME/dotfiles"
