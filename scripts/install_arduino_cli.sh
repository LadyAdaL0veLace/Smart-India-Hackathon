#!/bin/bash

# Check if sudo is available
if ! command -v sudo &> /dev/null; then
    echo "sudo is required for installing dependencies. Please make sure sudo is installed."
    exit 1
fi

# Check if curl is installed
if ! command -v curl &> /dev/null; then
    echo "curl is required to download Arduino CLI. Installing curl..."
    sudo apt-get update
    sudo apt-get install -y curl
fi

# Check if tar is installed
if ! command -v tar &> /dev/null; then
    echo "tar is required to extract Arduino CLI archive. Installing tar..."
    sudo apt-get update
    sudo apt-get install -y tar
fi

# Check if Arduino CLI is already installed
if command -v arduino-cli &> /dev/null; then
    echo "Arduino CLI is already installed. Exiting."
    exit 0
fi

# Download the latest Arduino CLI binary
echo "Downloading Arduino CLI..."
curl -fsSL https://downloads.arduino.cc/arduino-cli/arduino-cli_latest_Linux_64bit.tar.gz -o arduino-cli.tar.gz

# Extract the downloaded archive
echo "Extracting Arduino CLI archive..."
tar xf arduino-cli.tar.gz

# Move arduino-cli to a directory in PATH
echo "Moving Arduino CLI binary to /usr/local/bin/..."
sudo mv arduino-cli /usr/local/bin/

# Clean up
echo "Cleaning up..."
rm arduino-cli.tar.gz

echo "Arduino CLI installation completed successfully."

