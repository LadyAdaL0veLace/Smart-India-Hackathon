#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell08"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

file="/home/$username/encrypted.txt"
echo "The Password for the next lavel is shell09" | tr 'a-zA-Z' 'x-za-wX-ZA-W' > $file
echo "Encrypted password created"

chmod 440 $file
chown shell09 $file
chgrp $username $file
#chattr +i $file

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell08'" >> /home/$username/.bashrc
