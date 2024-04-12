#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell06"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Function to generate random strings
generate_random_strings() {
    for ((i=0; i<100; i++)); do
        tr -dc '[:print:]' < /dev/urandom | fold -w 32 | head -n 1
        #echo "$(cat /dev/urandom | fold -w 32 | head -n 1)"
    done
}

# Generate random strings
temp_file="/home/$username/temp_strings.txt"
generate_random_strings > $temp_file

# Count occurrences of each string and ensure there are at least two copies of each
awk '{count[$0]++} END {for (string in count) {if (count[string] < 2) {print string >> "/home/'"$username"'/temp_strings.txt"}}}' $temp_file

# Duplicate the strings
file="/home/$username/data.txt"
cat $temp_file $temp_file > $file

# Clean up temporary file
rm $temp_file

# Append the unique password
echo "The Password for the next level is shell07" >> $file

echo "data.txt created with random strings and the unique password."

chmod 640 $file
chown shell07 $file
chgrp $username $file
