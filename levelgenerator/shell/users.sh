#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Declare an array to store usernames and passwords
declare -A user_passwords

# Iterate over shell variables using a for loop
for ((i=0; i<=10; i++)); do
    # Generate username and password
    username="shell$(printf '%02d' $i)"
    password="shell$(printf '%02d' $i)"

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
        exit 1
    fi

    # Add username and password to the array
    user_passwords[$username]=$password
done

# Create users and set passwords
for username in "${!user_passwords[@]}"; do
    useradd -m -s /bin/bash "$username"
    echo "$username:${user_passwords[$username]}" | chpasswd
done

# Save usernames and passwords to a passwords.txt file
echo "Usernames and Passwords:" > /home/.passwords.txt
for username in "${!user_passwords[@]}"; do
    echo "Username: $username, Password: ${user_passwords[$username]}" >> /home/.passwords.txt
done

chmod 700 /home/.passwords.txt

echo "Usernames and passwords have been saved."