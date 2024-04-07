#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell01"
#password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
#passwordNextLevel=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
passwordNextLevel="shell02"

# Check if the user already exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a file named "-" and move it to the user's home directory
echo "The Password to the next level is $passwordNextLevel" > /home/$username/-

# create the level banner for shell01
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell01'" >> /home/shell01/.bashrc
