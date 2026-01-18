#Write a bash script which provides a simple menu for common & most frequent devops tasks such as checking status & restart service.
#Common for mundane BAU tasks.

#!/bin/bash

# Display menu options
echo "Server Management Menu:"
echo "1) Check disk usage"
echo "2) Restart nginx"
echo "3) View logs"
echo "q) Quit"

# Read user choice
read -p "Enter choice: " CHOICE

# Case to handle menu selection
case "$CHOICE" in
    1)
        echo "Checking disk usage:"
        df -h /
        ;;
    2)
        echo "Restarting nginx..."
        sudo systemctl restart nginx
        ;;
    3)
        echo "Viewing last 10 lines of nginx logs:"
        tail -n 10 /var/log/nginx/access.log
        ;;
    q)
        echo "Exiting."
        exit 0
        ;;
    *)
        echo "Invalid choice: $CHOICE." >&2
        exit 1
        ;;
esac