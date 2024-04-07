#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell04"
password="shell04"

# Get the user's primary group
user_group=$(id -g -n "$username")

# Remove the user and home directory
userdel -r "$username"
echo "User '$username' and home directory have been removed."

# Check if the group is used only by the deleted user
if [ $(getent group "$user_group" | grep -c "$username") -eq 0 ]; then
    groupdel "$user_group"
    echo "Group '$user_group' has been removed."
fi
