#!/bin/bash

# Exit immediately if any command exits with a non-zero status
set -e

# Get the current directory of the script
current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# Check if the current directory exists
if [ ! -d "$current_dir" ]; then
    echo "Error: Current directory does not exist."
    exit 1
fi

# Print the absolute path of the current directory
echo "$current_dir"
