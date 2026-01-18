#Write a bash script that detects the OS and installs a package accordingly. 
#Handy for cross-platform provisioning in DevOps.

#!/bin/bash

# Package to install
PACKAGE="vim"

# Detect OS type
OS=$(uname -s)

# Case for OS-specific installation
case "$OS" in
    Linux)
        # Further detect distro (simplified)
        if [ -f /etc/debian_version ]; then
            echo "Debian-based Linux detected. Using apt."
            sudo apt update && sudo apt install -y "$PACKAGE"
        elif [ -f /etc/redhat-release ]; then
            echo "RedHat-based Linux detected. Using yum."
            sudo yum install -y "$PACKAGE"
        else
            echo "Unsupported Linux distro." >&2
            exit 1
        fi
        ;;
    Darwin)
        echo "macOS detected. Using brew."
        brew install "$PACKAGE"
        ;;
    *)
        echo "Unsupported OS: $OS." >&2
        exit 1
        ;;
esac