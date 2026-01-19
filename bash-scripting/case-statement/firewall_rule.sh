#Write a bash script to perform firewall rule validation using match-expressions (DevOps task demo)

#!/bin/bash

RULE=$1

# Using case (match-expression) to validate firewall rules
case "$RULE" in
    allow-http)
        echo "Applying firewall rule: Allow HTTP (port 80)"
        ufw allow 80/tcp
        ;;
    allow-https)
        echo "Applying firewall rule: Allow HTTPS (port 443)"
        ufw allow 443/tcp
        ;;
    deny-all)
        echo "Applying firewall rule: Deny all incoming traffic"
        ufw default deny incoming
        ;;
    *)
        echo "Unknown rule: $RULE"
        echo "Valid options: allow-http | allow-https | deny-all"
        exit 1
        ;;
esac
