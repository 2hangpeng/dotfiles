#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check that two arguments were provided
if [[ $# -ne 2 ]]; then
    # Print usage message
    echo "Usage: $0 source destination"
    # Exit with error status
    exit 1
fi

# Save first argument as source path
source_path=$1
# Save second argument as destination path
destination_path=$2

# Check if source path exists
if [[ ! -e "$source_path" ]]; then
    # Print error message to standard error
    printf 'Error: Source path "%s" does not exist.\n' "$source_path" >&2
    # Exit with error status
    exit 1
fi

if [[ -d $source_path ]]; then
    # Check if source path is a directory
    # Check if destination path exists
    if [[ -e $destination_path ]]; then
        # Generate backup path with timestamp
        backup_path="${destination_path}_backup_$(date +"%Y%m%d%H%M%S")"
        # Move destination to backup path
        mv "$destination_path" "$backup_path"
    fi
    # Create destination directory if it doesn't exist
    mkdir -p "$destination_path"
    # Copy source directory to destination directory recursively
    cp -r "$source_path" "$destination_path"
else
    # Source path is a file
    # Check if destination path ends with a "/"
    if [[ $destination_path == */ ]]; then
        # Check if destination directory exists
        if [[ ! -d $destination_path ]]; then
            # Create destination directory if it doesn't exist
            mkdir -p $destination_path
        fi
        # Construct path for old file name
        old=$destination_path$(basename "$source_path")
        # Check if old file exists
        if [[ -e $old ]]; then
            # Generate backup path with timestamp
            backup_path="${old}_backup_$(date +"%Y%m%d%H%M%S")"
            # Move old file to backup path
            mv "$old" "$backup_path"
        fi
        # Copy file to destination with original file name
        cp "$source_path" "$destination_path$(basename "$source_path")"
    else
        # Destination path is a file path
        # Save destination path as old
        old=$destination_path
        # Check if old file exists
        if [[ -e $old ]]; then
            # Generate backup path with timestamp
            backup_path="${old}_backup_$(date +"%Y%m%d%H%M%S")"
            # Move old file to backup path
            mv "$old" "$backup_path"
        fi
        # Get the parent directory of the destination path
        parent_dir=$(dirname "$destination_path")
        # Check if parent directory exists
        if [ ! -d "$parent_dir" ]; then
            # Create parent directory if it doesn't exist
            mkdir -p "$parent_dir"
            # Print message indicating that directory was created
            echo "Created directory: $parent_dir"
        fi
        # Copy file to destination with specified file name
        cp "$source_path" "$destination_path"
    fi
fi
