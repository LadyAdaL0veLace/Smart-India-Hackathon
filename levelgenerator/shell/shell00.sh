#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell00"
passwordNextLevel="shell01"

# Check if the user already exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a readme.txt file
echo "The Password to the next level is $passwordNextLevel" > /home/$username/readme.txt
echo "readme.txt file has been created."

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell00'" >> /home/shell00/.bashrc
