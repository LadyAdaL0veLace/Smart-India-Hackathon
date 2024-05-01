#!/bin/bash

# Check if an argument is provided
if [[ $# -eq 0 ]]; then
  echo "usage: ./verify_ip_address <x.x.x.x>"
  exit 1
fi

# Define the input IP address
ip_address="$1"
password="shell01"

# Validate the IP address format using regular expression
if [[ ! $ip_address =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
  echo "Error: Invalid IP address format."
  exit 1
fi

# Get the machine's IP address
machine_ip=$(ip route get 8.8.8.8 | awk '{print $7}')

# Compare the input IP and machine IP
if [[ "$ip_address" == "$machine_ip" ]]; then
  echo "password: $password"
else
  echo "Find the correct ipv4 address to obtain the password to the next level."
fi

