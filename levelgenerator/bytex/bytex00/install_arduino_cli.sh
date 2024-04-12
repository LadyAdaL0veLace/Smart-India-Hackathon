#!/bin/bash

### Check if Arduino CLI is already installed
if command -v arduino-cli &> /dev/null; then
    echo "Arduino CLI is already installed. Exiting."
    exit 0
fi

### Download the latest Arduino CLI binary
echo "Downloading and installing Arduino CLI..."
curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

### Move the executable to `/usr/bin`
echo "Moving arduino-cli executable to /usr/bin/arduino-cli..."
sudo mv bin/arduino-cli /usr/bin/

### Make the file executable
echo "Making arduino-cli executable..."
sudo chmod a+x /usr/bin/arduino-cli

### Add arduino-cli to path
if grep -qxF "PATH=\$PATH:/usr/bin/arduino-cli" /etc/environment; then
    echo "Path already exists in /etc/environment"
else
    echo "Adding arduino-cli to PATH in /etc/environment..."
    sudo sh -c 'echo "PATH=\$PATH:/usr/bin/arduino-cli" >> /etc/environment'
    echo "Path added to /etc/environment"
fi

### source bashrc for changes to take place
echo "Sourcing .bashrc to apply changes..."
source ~/.bashrc

### The first thing to do after the installation is to update the list of the boards supported with the related compilation toolchains, as well as available libraries:
echo "Updating Arduino CLI core index..."
arduino-cli core update-index

### Once the core update is finished, we add support to cards with AVR microprocessor, such as Arduino Uno, Arduino Nano, etc.
echo "Installing Arduino AVR core..."
arduino-cli core install arduino:avr

### Cleanup
echo "Cleaning up..."
sudo rm -r bin/

