#!/bin/bash

echo "Installing system configs..."

# ly display manager config
sudo cp ~/dotfiles/system/ly/* /etc/ly/

echo "System configs installed successfully!"
echo "You may need to restart ly service: sudo systemctl restart ly"
