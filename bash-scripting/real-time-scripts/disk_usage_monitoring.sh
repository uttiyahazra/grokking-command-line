#Write a bash script that continuously monitors disk usage every 10 seconds and alerts if it exceeds 80%. 
#Useful for real-time monitoring in DevOps dashboards or alerts.

#!/bin/bash

# Threshold for alert (percentage)
THRESHOLD=80

# Infinite loop for continuous monitoring
while true; do
    # Get current disk usage for root filesystem
    USAGE=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    
    # Check if usage exceeds threshold
    if [ "$USAGE" -gt "$THRESHOLD" ]; then
        echo "Alert: Disk usage is $USAGE% (exceeds $THRESHOLD%)."
        # Add alert logic here, e.g., send email or notify Slack
    else
        echo "Disk usage is $USAGE% (below threshold)."
    fi
    
    sleep 10  # Wait 10 seconds before next check
done