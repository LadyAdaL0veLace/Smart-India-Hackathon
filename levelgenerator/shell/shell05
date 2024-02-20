#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell05"
password="shell05"

# Check if the user already exists
if id "$username" &>/dev/null; then
    echo "User '$username' already exists."
    exit 1
fi

# Create the user with the hardcoded username and password
useradd -m -s /bin/bash "$username"
echo "$username:$password" | chpasswd

echo "User '$username' created successfully with password."

# Create a file with two columns of 200 random alphabets and include the specified word and text
echo "millionth The password to the next file is shell06" > file_with_columns
for i in {1..199}; do
    echo -n "$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 1 | head -n 1) " >> file_with_columns
    echo -n "$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 1 | head -n 1) " >> file_with_columns
done
echo >> file_with_columns

echo "Created file_with_columns with two columns of 200 random alphabets and the specified word and text."

