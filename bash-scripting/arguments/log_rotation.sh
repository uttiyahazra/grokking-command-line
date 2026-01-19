#Write a bash script to perform log rotation based on arguments (DevOps task demo)

#!/bin/bash

# $1 = source log file
# $2 = destination directory

if [ $# -ne 2 ]; then
    echo "Usage: $0 <logfile> <destination_dir>"
    exit 1
fi

LOGFILE="$1"
DESTDIR="$2"

# Ensure destination exists
mkdir -p "$DESTDIR"

# Rotate log by moving and appending timestamp
TIMESTAMP=$(date +%F_%H-%M-%S)
mv "$LOGFILE" "$DESTDIR/log_$TIMESTAMP"

echo "Log rotated: $LOGFILE -> $DESTDIR/log_$TIMESTAMP"
