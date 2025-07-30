#!/bin/bash
echo "Installing system configs..."

# Check if ly directory exists
if [ ! -d "/etc/ly/" ]; then
    echo "Warning: /etc/ly/ directory not found. Is ly installed?"
    echo "Install ly first: sudo pacman -S ly"
    exit 1
fi

# ly display manager config
if [ -d "~/dotfiles/system/ly" ]; then
    sudo cp ~/dotfiles/system/ly/* /etc/ly/
    echo "ly configs installed"
else
    echo "ly configs not found in ~/dotfiles/system/ly"
fi

echo "System configs installed successfully!"
echo "You may need to restart ly service: sudo systemctl restart ly"
