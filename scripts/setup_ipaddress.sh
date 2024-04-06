#!/bin/bash

# Create the /opt/scripts directory if it doesn't exist
if [ ! -d "/opt/scripts" ]; then
    sudo mkdir /opt/scripts
    sudo chmod 755 /opt/scripts
fi

# Make the display_network_info.py file executable
chmod +x display_network_info.py

# Copy the display_network_info.py file to /opt/scripts
sudo cp display_network_info.py /opt/scripts/

# Add an entry to ~/.bashrc to run the script at startup
script_path="/opt/scripts/display_network_info.py"
bashrc_entry="python3 $script_path &"

# Check if the entry already exists in ~/.bashrc
if ! grep -Fxq "$bashrc_entry" ~/.bashrc; then
    echo "$bashrc_entry" >> ~/.bashrc
fi

echo "Setup completed. The script will run at startup."
