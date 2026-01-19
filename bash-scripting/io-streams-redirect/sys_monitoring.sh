#Write a bash script to perform system monitoring with I/O stream redirection (DevOps task demo)

#!/bin/bash

OUTPUT_FILE="/var/log/sys_monitor.log"
ERROR_FILE="/var/log/sys_monitor.err"

# Redirect stdout to OUTPUT_FILE and stderr to ERROR_FILE
{
    echo "=== System Monitoring Report ==="
    date
    echo "CPU Load:"
    uptime

    echo "Disk Usage:"
    df -h

    echo "Memory Usage:"
    free -m
} >"$OUTPUT_FILE" 2>"$ERROR_FILE"

echo "Monitoring report saved to $OUTPUT_FILE"
echo "Errors (if any) logged to $ERROR_FILE"
