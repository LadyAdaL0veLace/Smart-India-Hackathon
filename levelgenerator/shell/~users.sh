#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Remove users and their home directories
for ((i=0; i<=10; i++)); do
    username="shell$(printf '%02d' $i)"

    # Remove user and home directory
    rm -rf /home/"$username"
    userdel -r "$username" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "User '$username' has been removed."
    else
        echo "Failed to remove user '$username'."
    fi
done

# Remove .passwords.txt file from home directory
passwords_file="/home/.passwords.txt"
if [ -f "$passwords_file" ]; then
    rm "$passwords_file"
    echo "The .passwords.txt file has been removed from the home directory."
else
    echo "The .passwords.txt file does not exist in the home directory."
fi

echo "Uninstallation completed."

