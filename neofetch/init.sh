#!/bin/bash

# Exit immediately if any command exits with a non-zero status
set -e

# Get the directory of the script
current_dir=$(dirname "$BASH_SOURCE")

# Get the absolute path of the directory
current_path=$(realpath "$current_dir")

echo "当前脚本的目录路径为：$current_dir"
echo "当前脚本的绝对路径为：$current_path"

# Set the neofetch configuration
neofetch_dir="$HOME/.config/neofetch"
if [ ! -d "$neofetch_dir" ]; then
  mkdir -p "$neofetch_dir"
fi
cp "$current_dir/config.conf" "$neofetch_dir/"
