#!/bin/bash

# Run install_arduino_cli.sh if it exists
if [ -f "install_arduino_cli.sh" ]; then
    echo "Running install_arduino_cli.sh..."
    bash install_arduino_cli.sh
else
    echo "install_arduino_cli.sh not found in the current directory."
fi

# Run setup_ipaddress.sh if it exists
if [ -f "setup_ipaddress.sh" ]; then
    echo "Running setup_ipaddress.sh..."
    bash setup_ipaddress.sh
else
    echo "setup_ipaddress.sh not found in the current directory."
fi

# Run install_glow.sh if it exists
if [ -f "install_glow.sh" ]; then
    echo "Running install_glow.sh..."
    bash install_glow.sh
else
    echo "install_glow.sh not found in the current directory."
fi

