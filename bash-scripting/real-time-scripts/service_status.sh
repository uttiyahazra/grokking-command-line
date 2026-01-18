#Write a bash script which allows user to enter a desired service whose status needs to be checked using `systemctl`. If the Service
# isn't currently running, the script should resart it.

#!/bin/bash

# Asks for user input for target service name
echo "Enter the Service Name: "
read SERVICE_NAME

# Check if the service is active
if systemctl is-active --quiet "$SERVICE_NAME"; then
    echo "Service $SERVICE_NAME is running."
else
    # Attempt to restart the service if it's not running
    echo "Service $SERVICE_NAME is not running. Attempting to restart..."
    if systemctl restart "$SERVICE_NAME"; then
        echo "Service $SERVICE_NAME restarted successfully."
    else
        echo "Failed to restart $SERVICE_NAME." >&2
        exit 1  # Exit with error code for scripting purposes
    fi
fi