#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell02"
#password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
#passwordNextLevel=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
password="shell02"
passwordNextLevel="shell03"

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

echo "User '$username' created successfully with password."

# Create a directory named inhere in the user's home directory
mkdir /home/$username/inhere
echo "Directory named 'inhere' has been created in the user's home directory."

# Create a file named .hidden in the directory inhere
echo "The password to the next level is shell03" > /home/$username/inhere/.hidden
echo "File named '.hidden' has been created in 'inhere' directory."

echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'shell02'" >> /home/shell02/.bashrc
