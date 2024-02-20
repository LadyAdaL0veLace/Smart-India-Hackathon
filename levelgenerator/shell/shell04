#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell04"
password="shell04"

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

echo "User '$username' created successfully with password."

# Create a file with human-readable text, 1033 bytes in size, not executable
echo "The password for the next level is shell05" > file0
truncate -s 1033 password_file
chmod -x password_file
echo "Created password_file with human-readable text, 1033 bytes in size, not executable."

# Create 10 files without the specified features
for i in {1..10}; do
    echo -n -e '\x10\x20\x30\x40\x50\x60\x70\x80' > file$i
    echo "Created file$i without the specified features."
done
