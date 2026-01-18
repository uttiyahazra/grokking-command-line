#Write a bash script that iterates over a list of directories and creates timestamped backups using tar.

#!/bin/bash

# Array of directories to backup
DIRECTORIES=("/etc" "/var/log" "/home/user/data")

# Destination backup directory
BACKUP_DIR="/backups"
mkdir -p "$BACKUP_DIR"  # Ensure backup directory exists

# Loop through each directory
for DIR in "${DIRECTORIES[@]}"; do
    # Create a timestamped backup filename
    BACKUP_FILE="$BACKUP_DIR/$(basename "$DIR")_$(date +%Y%m%d_%H%M%S).tar.gz"
    
    # Check if directory exists before backing up
    if [ -d "$DIR" ]; then
        echo "Backing up $DIR to $BACKUP_FILE..."
        tar -czf "$BACKUP_FILE" "$DIR"  # Compress the directory
        if [ $? -eq 0 ]; then  # Check if tar succeeded
            echo "Backup of $DIR completed."
        else
            echo "Backup of $DIR failed." >&2
        fi
    else
        echo "Directory $DIR does not exist. Skipping." >&2
    fi
done