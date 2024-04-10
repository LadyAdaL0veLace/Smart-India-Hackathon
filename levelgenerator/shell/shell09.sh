#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell09"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

chmod 440 /home/$username/data.txt
chown shell10 /home/$username/data.txt
chgrp $username /home/$username/data.txt
chattr +i /home/$username/data.txt

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell09'" >> /home/$username/.bashrc
