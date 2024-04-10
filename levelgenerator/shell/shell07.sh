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
generate_random_strings > /home/$username/temp_strings.txt

# Create data.txt with random strings and the hidden password
cat /home/$username/temp_strings.txt > /home/$username/data.txt
echo "========== The" >> /home/$username/data.txt
echo "========== Password" >> /home/$username/data.txt
echo "========== is=" >> /home/$username/data.txt
echo "========== shell08" >> /home/$username/data.txt

# Clean up temporary file
rm /home/$username/temp_strings.txt

echo "data.txt created with random strings and the hidden password."


chmod 440 /home/$username/data.txt
chown shell08 /home/$username/data.txt
chgrp $username /home/$username/data.txt
chattr +i /home/$username/data.txt

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell07'" >> /home/$username/.bashrc

