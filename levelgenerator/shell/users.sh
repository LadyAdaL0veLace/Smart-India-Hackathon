#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi


# Declare an array to store usernames and passwords
declare -A user_passwords

# Initialize variables
shell_var="shell00"
passwd_var="passwd00"

# Iterate over shell variables using a for loop
for ((i=0; i<=10; i++)); do
    # Print username and generate password
    echo "Username: ${!shell_var}"
    # Generate random password
    passwd_value=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 64 ; echo '')

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi


    shell_var="shell$(printf '%02d' $((10#$i + 1)))"
    passwd_var="passwd$(printf '%02d' $((10#$i + 1)))"
done

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$passwd00" | chpasswd


# Display usernames and passwords stored in the array
echo "Usernames and Passwords:"
for username in "${!user_passwords[@]}"; do
    echo "Username: $username, Password: ${user_passwords[$username]}"
done




# Save the generated password to a file in /home/pi directory
echo "shell00:$passwd00" > /home/pi/passwords.txt
echo "Password saved in /home/pi/passwords.txt."
echo "User '$username' created successfully with password."


# Store the password for the next level in the passwords file so that next level can grab the password from the file.
echo -e "\nshell01:$passwd01" >> /home/pi/passwords.txt


# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell00'" >> /home/shell00/.bashrc
