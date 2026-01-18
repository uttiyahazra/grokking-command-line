#Write a bash script that finds log files older than 7 days in a directory and compresses them.
#Common in log management to save disk space.

#!/bin/bash

# Directory containing logs
LOG_DIR="/var/log"

# Find and compress logs older than 7 days
for LOG_FILE in $(find "$LOG_DIR" -type f -name "*.log" -mtime +7); do
    # Check if file is not already compressed
    if [[ ! "$LOG_FILE" =~ \.gz$ ]]; then
        echo "Compressing $LOG_FILE..."
        gzip "$LOG_FILE"
        if [ $? -eq 0 ]; then
            echo "Compressed $LOG_FILE successfully."
        else
            echo "Failed to compress $LOG_FILE." >&2
        fi
    fi
done