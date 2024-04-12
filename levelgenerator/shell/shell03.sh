
#!/bin/bash

# Check if the script is run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root."
    exit 1
fi

username="shell03"

#Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User '$username' does not exist."
    exit 1
fi

# Directory path
dir_path="/home/$username/dir"

# Create the directory
mkdir -p "$dir_path"

# Change ownership to root
chown root:root "$dir_path"

# Set permissions to 775
chmod 775 "$dir_path"

# Create a file with non-human-readable text
echo -n -e '\x10\x20\x30\x40\x50\x60\x70\x80' > $dir_path/-file1
echo "Created file1 with non-human-readable text."

echo -n -e '\x0A\x0B\x0C\x0D\x0E\x0F' > $dir_path/-file2
echo "Created file2 with non-human-readable text."

echo -n -e '\x01\x02\x03\x04\x05\x06\x07\x08' > $dir_path/-file3
echo "Created file3 with non-human-readable text."

echo -n -e '\xAA\xBB\xCC\xDD\xEE\xFF' > $dir_path/-file4
echo "Created file4 with non-human-readable text."

# Create a file with human-readable text
echo "The password for the next level is shell04" > $dir_path/-file5
echo "Created password_file with human-readable text."

echo -n -e '\x01\x0A\x03\xAA\x05\x06\x07\x08' > $dir_path/-file6
echo "Created file6 with non-human-readable text."

echo -n -e '\x01\x02\x03\x0E\x05\xFF\x07\x0C' > $dir_path/-file7
echo "Created file7 with non-human-readable text."

echo -n -e '\x01\x02\x03\xBB\x05\x0F\x07\x08' > $dir_path/-file8
echo "Created file8 with non-human-readable text."

# Set permissions for files
    for ((j=1; j<=8; j++)); do
        file="$dir_path/-file$j"
        chmod 640 "$file"
        chown shell04:"$username" "$file"
    done

