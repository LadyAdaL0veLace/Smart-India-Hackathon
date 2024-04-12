#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Run users.sh file
./users.sh

# Run files named shell00 to shell09 using a for loop
for ((i=0; i<=9; i++)); do
    filename="shell0$i.sh"
    if [ -f "$filename" ]; then
        ./"$filename"
    else
        echo "File $filename not found."
    fi
done
