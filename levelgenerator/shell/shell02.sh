#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell02"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a directory named inhere in the user's home directory
mkdir /home/$username/inhere
echo "Directory named 'inhere' has been created in the user's home directory."

# Create a file named .hidden in the directory inhere
echo "The password to the next level is shell03" > /home/$username/inhere/.hidden
echo "File named '.hidden' has been created in 'inhere' directory."

chmod 441 /home/$username/inhere
chown $username /home/$username/inhere
chgrp shell03 /home/$username/inhere
chmod 440  /home/$username/inhere/.hidden
chown $username /home/$username/inhere/.hidden
chgrp shell03  /home/$username/inhere/.hidden

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell02'" >> /home/$username/.bashrc
