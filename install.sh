#!/bin/bash

echo "Installing dotfiles..."

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Remove existing configs and create symlinks
rm -rf ~/.config/alacritty ~/.config/i3 ~/.config/picom ~/.config/dunst ~/.config/flameshot
ln -sf ~/dotfiles/config/alacritty ~/.config/alacritty
ln -sf ~/dotfiles/config/i3 ~/.config/i3
ln -sf ~/dotfiles/config/picom ~/.config/picom
ln -sf ~/dotfiles/config/dunst ~/.config/dunst
ln -sf ~/dotfiles/config/flameshot ~/.config/flameshot

# Shell config
ln -sf ~/dotfiles/bashrc ~/.bashrc

echo "User configs installed successfully!"
echo ""
echo "To install system configs (ly), run:"
echo "sudo ./install-system.sh"
