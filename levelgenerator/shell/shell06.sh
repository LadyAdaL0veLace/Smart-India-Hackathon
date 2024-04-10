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
generate_random_strings > /home/$username/temp_strings.txt

# Count occurrences of each string and ensure there are at least two copies of each
awk '{count[$0]++} END {for (string in count) {if (count[string] < 2) {print string >> "/home/'"$username"'/temp_strings.txt"}}}' /home/$username/temp_strings.txt

# Duplicate the strings
cat /home/$username/temp_strings.txt /home/$username/temp_strings.txt > /home/$username/data.txt

# Clean up temporary file
rm /home/$username/temp_strings.txt

# Append the unique password
echo "The Password for the next level is shell07" >> /home/$username/data.txt

echo "data.txt created with random strings and the unique password."

chmod 440 /home/$username/data.txt
chown $username /home/$username/data.txt
chgrp shell07 /home/$username/data.txt

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell06'" >> /home/$username/.bashrc

