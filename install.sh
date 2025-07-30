#!/bin/bash

echo "Installing dotfiles with GNU Stow..."

# Detect OS and set package manager
if command -v pacman &> /dev/null; then
    INSTALL_CMD="sudo pacman -S --noconfirm"
    echo "Detected Arch Linux"
elif command -v apt &> /dev/null; then
    INSTALL_CMD="sudo apt update && sudo apt install -y"
    echo "Detected Ubuntu/Debian"
elif command -v dnf &> /dev/null; then
    INSTALL_CMD="sudo dnf install -y"
    echo "Detected Fedora"
else
    echo "Unsupported package manager. Please install packages manually."
    exit 1
fi

# Install GNU Stow first
echo "Installing GNU Stow..."
$INSTALL_CMD stow

# Install essential packages
echo "Installing essential packages..."
$INSTALL_CMD \
    i3 \
    alacritty \
    rofi \
    picom \
    dunst \
    flameshot \
    maim \
    xclip \
    xdotool \
    polybar \
    nm-applet \
    feh \
    i3lock \
    xss-lock \
    dex \
    pulseaudio-utils \
    git \
    curl \
    wget

# Optional packages (comment out if not needed)
echo "Installing optional packages..."
$INSTALL_CMD \
    brightnessctl \
    playerctl

# Create necessary directories
echo "Creating necessary directories..."
mkdir -p ~/.config
mkdir -p ~/.local/bin

# Navigate to dotfiles directory
if [ ! -d ~/dotfiles ]; then
    echo "Error: ~/dotfiles directory not found!"
    echo "Please clone your dotfiles repo to ~/dotfiles first"
    exit 1
fi

cd ~/dotfiles

# List of packages to stow (based on your directory structure)
PACKAGES=(
    "i3"
    "alacritty" 
    "picom"
    "dunst"
    "flameshot"
    "rofi"
)

# Check if bashrc exists and add it to packages
if [ -f "bashrc" ]; then
    PACKAGES+=("bashrc")
fi

# Unstow existing packages (in case of reinstall)
echo "Removing any existing stowed configs..."
for package in "${PACKAGES[@]}"; do
    if [ -d "$package" ]; then
        stow -D "$package" 2>/dev/null || true
    fi
done

# Stow all packages
echo "Stowing configurations..."
for package in "${PACKAGES[@]}"; do
    if [ -d "$package" ]; then
        echo "Stowing $package..."
        stow "$package"
        echo "$package stowed"
    else
        echo "Warning: $package directory not found"
    fi
done

# Handle system directory if it exists
if [ -d "system" ]; then
    echo "⚠️  System configs found - run install-system.sh separately"
fi

echo ""
echo "Dotfiles installed successfully with Stow!"
echo ""
echo "Packages stowed:"
for package in "${PACKAGES[@]}"; do
    if [ -d "$package" ]; then
        echo "- $package"
    fi
done
echo ""
echo "Next steps:"
echo "1. Reload your shell: source ~/.bashrc"
echo "2. Restart i3 or log out/in to apply all changes"
echo "3. To install system configs, run: sudo ./install-system.sh"
echo ""
echo "Setup complete!"
