#!/bin/bash

# List of files/folders to symlink in homedir
files="zshrc"

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks 
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf "$SCRIPT_DIR/$file" "$HOME/.$file"
done

echo "Setup complete!"
