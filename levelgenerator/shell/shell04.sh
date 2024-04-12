#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell04"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a file with human-readable text, 1033 bytes in size, not executable
echo "The password for the next level is shell05" > /home/$username/file8
truncate -s 1033 /home/$username/file8
chmod -x /home/$username/file8
echo "Created password_file with human-readable text, 1033 bytes in size, not executable."

# Create 10 files without the specified features
for ((i=0;i<=7;i++)); do
    echo -n -e '\x10\x20\x30\x40\x50\x60\x70\x80' > /home/$username/file$i
    echo "Created file$i without the specified features."
done

for ((i=9;i<=12;i++)); do
    echo -n -e '\x10\x20\x30\x40\x50\x60\x70\x80' > /home/$username/file$i
    echo "Created file$i without the specified features."
done

# Set permissions for files
    for ((j=0; j<=12; j++)); do
        file="/home/$username/file$j"
        chmod 640 $file
        chown shell05 $file
        chgrp $username $file
    done

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell04'" >> /home/$username/.bashrc
