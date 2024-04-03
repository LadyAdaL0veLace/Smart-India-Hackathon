#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell01"
#password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
#passwordNextLevel=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
password="shell01"
passwordNextLevel="shell02"

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

echo "User '$username' created successfully with password."

# Create a file named "-" and move it to the user's home directory
echo "The Password to the next level is shell02" > -
mv -t /home/$username -
echo "File named '-' has been created and moved to the user's home directory."

# create the level banner for shell01
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'shell01'" >> /home/shell01/.bashrc
