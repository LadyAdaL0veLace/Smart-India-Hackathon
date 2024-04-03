#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell03"
passwd="shell03"

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$passwd" | chpasswd

echo "User '$username' created successfully with password."

# Create a file with non-human-readable text
echo -n -e '\x10\x20\x30\x40\x50\x60\x70\x80' > file1
echo "Created file1 with non-human-readable text."

# Create another file with non-human-readable text
echo -n -e '\x0A\x0B\x0C\x0D\x0E\x0F' > file2
echo "Created file2 with non-human-readable text."

# Create two more files with non-human-readable text
echo -n -e '\x01\x02\x03\x04\x05\x06\x07\x08' > file3
echo "Created file3 with non-human-readable text."

echo -n -e '\xAA\xBB\xCC\xDD\xEE\xFF' > file5
echo "Created file4 with non-human-readable text."

# Create a file with human-readable text
echo "The password for the next level is: shell04" > file4
echo "Created password_file with human-readable text."
