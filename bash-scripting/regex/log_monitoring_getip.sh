#Write a bash script to perform log monitoring and extract IP addresses using regex (DevOps task demo)

#!/bin/bash

LOGFILE="/var/log/auth.log"
BLACKLIST="/var/log/blacklisted_ips.txt"

echo "Monitoring $LOGFILE for failed login attempts..."
echo "Blacklisted IPs will be saved to $BLACKLIST"

# Tail the log file in real-time
tail -f "$LOGFILE" | while read line; do
    # Regex explanation:
    # "Failed password" → literal match for failed login attempts
    # ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+) → capture IPv4 address (four groups of digits separated by dots)
    if [[ $line =~ Failed\ password.*from\ ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+) ]]; then
        IP="${BASH_REMATCH[1]}"
        echo "❌ Failed login attempt detected from IP: $IP"
        
        # Append to blacklist file if not already present
        if ! grep -q "$IP" "$BLACKLIST"; then
            echo "$IP" >> "$BLACKLIST"
            echo "⚠️  IP $IP added to blacklist."
        fi
    fi
done
