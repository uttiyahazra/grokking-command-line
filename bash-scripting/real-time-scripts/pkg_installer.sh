#Write a bash script that reads a list of packages from a file and installs the using apt (Ubuntu/Debian based system)
#Useful in provisioning scripts for servers.

#!/bin/bash

# File containing package names, one per line
PACKAGE_LIST="packages.txt"

# Ensure the package list exists
if [ ! -f "$PACKAGE_LIST" ]; then
    echo "Package list file $PACKAGE_LIST not found." >&2
    exit 1
fi

# Update package index first
sudo apt update -y

# Read and install each package
while IFS= read -r PACKAGE; do
    # Skip empty lines or comments
    if [[ -z "$PACKAGE" || "$PACKAGE" =~ ^# ]]; then
        continue
    fi
    
    echo "Installing $PACKAGE..."
    sudo apt install -y "$PACKAGE"
    if [ $? -ne 0 ]; then  # Handle installation failure
        echo "Failed to install $PACKAGE." >&2
    fi
done < "$PACKAGE_LIST"  # Redirect file to while loop for reading