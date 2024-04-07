#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Get the home directory of the root user
home_dir=$(getent passwd root | cut -d: -f6)

# Remove users
for ((i=0; i<=10; i++)); do
    username="shell$(printf '%02d' $i)"
    userdel -r "$username" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "User '$username' has been removed."
    else
        echo "Failed to remove user '$username'."
    fi
done

# Remove .passwords.txt file from home directory
if [ -f /home/.passwords.txt ]; then
    rm /home/.passwords.txt
    echo "The .passwords.txt file has been removed from the home directory."
else
    echo "The .passwords.txt file does not exist in the home directory."
fi

echo "Uninstallation completed."