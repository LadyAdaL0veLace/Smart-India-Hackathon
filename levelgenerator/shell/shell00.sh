#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell00"
passwd00="shell00"
#passwd01=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')
passwd01="shell01"

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$passwd00" | chpasswd

# Save the generated password to a file in /home/pi directory
echo "shell00:$passwd00" > /home/pi/passwords.txt
echo "Password saved in /home/pi/passwords.txt."
echo "User '$username' created successfully with password."

# Create a readme.txt file
echo "The Password to the next level is $passwd01" > /home/shell00/readme.txt
echo "readme.txt file has been created."

# Store the password for the next level in the passwords file so that next level can grab the password from the file.
echo -e "\nshell01:$passwd01" >> /home/pi/passwords.txt


# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell00'" >> /home/shell00/.bashrc
