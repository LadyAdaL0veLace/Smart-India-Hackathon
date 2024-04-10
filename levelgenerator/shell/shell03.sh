#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell03"

#Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a file with non-human-readable text
echo -n -e '\x10\x20\x30\x40\x50\x60\x70\x80' > /home/$username/file1
echo "Created file1 with non-human-readable text."

echo -n -e '\x0A\x0B\x0C\x0D\x0E\x0F' > /home/$username/file2
echo "Created file2 with non-human-readable text."

echo -n -e '\x01\x02\x03\x04\x05\x06\x07\x08' > /home/$username/file3
echo "Created file3 with non-human-readable text."

echo -n -e '\xAA\xBB\xCC\xDD\xEE\xFF' > /home/$username/file4
echo "Created file4 with non-human-readable text."

# Create a file with human-readable text
echo "The password for the next level is shell04" > /home/$username/file5
echo "Created password_file with human-readable text."

echo -n -e '\x01\x0A\x03\xAA\x05\x06\x07\x08' > /home/$username/file6
echo "Created file6 with non-human-readable text."

echo -n -e '\x01\x02\x03\x0E\x05\xFF\x07\x0C' > /home/$username/file7
echo "Created file7 with non-human-readable text."

echo -n -e '\x01\x02\x03\xBB\x05\x0F\x07\x08' > /home/$username/file8
echo "Created file8 with non-human-readable text."

# Set permissions for files
    for ((j=1; j<=8; j++)); do
        file="/home/$username/file$j"
        chmod 440 "$file"
        chown $username "$file"
        chgrp shell04 "$file"
    done

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell03'" >> /home/$username/.bashrc
