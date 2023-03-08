
# Check if Fish is installed
if [ -x "$(command -v zsh)" ]; then
  echo "Fish is already installed"
else
  # Install Homebrew on macOS if not already installed
  if [ "$(uname)" == "Darwin" ]; then
    if [ ! -x "$(command -v brew)" ]; then
      echo "Installing Homebrew on macOS"
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi

    echo "Installing Fish on macOS"
    brew install fish
  fi

  # Install Fish on Linux
  if [ "$(uname)" == "Linux" ]; then
    echo "Installing Fish on Linux"
    sudo apt-get update
    sudo apt-get install fish
  fi
fi

# Set Fish as the default shell
if [ "$SHELL" != "$(which fish)" ]; then
  echo "Setting Fish as the default shell"
  chsh -s "$(which fish)"
fi
