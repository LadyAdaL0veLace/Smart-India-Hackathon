#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell01"

# Create a file named "-"
file="/home/$username/-"
echo "The Password to the next level is shell02" > $file
echo "File named '-' has been created."
chmod 640 $file
chown shell02 $file
chgrp $username $file

# create the level banner for shell01
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell01'" >> /home/$username/.bashrc
