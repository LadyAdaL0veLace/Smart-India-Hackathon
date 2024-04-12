#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

# Declare an array to store usernames and passwords
declare -A user_passwords

echo "Usernames and Passwords:" > /home/.passwords.txt

# Starting UID for users
start_uid=10000

# Iterate over shell variables using a for loop
for ((i=0; i<=10; i++)); do
    # Generate username and password
    username="shell$(printf '%02d' $i)"
    password="shell$(printf '%02d' $i)"
    group="$username"  # Group name same as username

    # Check if the user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists. Skipping..."
        continue
    fi

    # Add username and password to the array
    user_passwords[$username]=$password

    # Create user with home directory
    useradd -m -s /bin/bash -u $((start_uid + i)) "$username"
    if [ $? -eq 0 ]; then
        echo "$username:${user_passwords[$username]}" | chpasswd
        echo "User '$username' created."
    else
        echo "Failed to create user '$username'."
        continue
    fi

    # Add user to group
    usermod -aG "$group" "$username"
    if [ $? -eq 0 ]; then
        echo "User '$username' added to group '$group'."
    else
        echo "Failed to add user '$username' to group '$group'."
    fi

    echo "Username: $username, Password: ${user_passwords[$username]}" >> /home/.passwords.txt

    # cat the figlet banner om the .bashrc file
    echo "figlet -lf /usr/share/figlet/ANSIShadow.flf '$username'" >> /home/$username/.bashrc
done

chmod 700 /home/.passwords.txt

echo "Usernames, passwords, and groups have been saved."

