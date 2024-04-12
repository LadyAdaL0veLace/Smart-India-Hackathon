#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell07"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Function to generate random strings
generate_random_strings() {
    for ((i=0; i<50; i++)); do
        echo "$(cat /dev/urandom | fold -w 32 | head -n 1)"
    done
}

# Generate random strings
temp_file="/home/$username/temp_strings.txt"
generate_random_strings > $temp_file

# Create data.txt with random strings and the hidden password
file="/home/$username/data.txt"
cat $temp_file > $file
echo "========== The" >> $file
echo "========== Password" >> $file
echo "========== is=" >> $file
echo "========== shell08" >> $file

# Clean up temporary file
rm $temp_file

echo "data.txt created with random strings and the hidden password."


chmod 640 $file
chown shell08 $file
chgrp $username $file

