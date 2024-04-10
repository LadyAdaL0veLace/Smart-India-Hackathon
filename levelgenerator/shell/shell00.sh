#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell00"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a readme.txt file
echo "The Password to the next level is shell01" > /home/$username/readme.txt
echo "readme.txt file has been created."

chmod 440 /home/$username/readme.txt
chown shell01 /home/$username/readme.txt
chgrp $username /home/$username/readme.txt
chattr +i /home/$username/readme.txt

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell00'" >> /home/$username/.bashrc
