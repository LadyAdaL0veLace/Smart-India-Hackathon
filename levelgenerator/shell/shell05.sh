#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell05"

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Create a file with random words in two columns
file="/home/$username/inhere.txt"
echo "The password to the next file is shell06" > $file
for ((i=0; i<600; i++)); do
    word1=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 10 | head -n 1)
    word2=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 15 | head -n 1)
    echo "$word1     $word2" >> $file
done
echo "Created file with random words in two columns."

# Insert specified phrase at the 700th line
sed -i '500i\millionth     the password to the next level is shell06' $file
echo "Inserted specified phrase at the 500th line."

chmod 440 $file
chown shell06 $file
chgrp $username $file
#chattr +i $file

# cat the figlet bammer om the .bashrc file
echo "figlet -lf /usr/share/figlet/ANSIShadow.flf 'Shell05'" >> /home/$username/.bashrc

