#Write a bash script which can attempt several API Retry calls against a REST API Endpoint. 
#The MAX_RETRIES and SLEEP_SECONDS will be provided as argument while executing the script.

#!/bin/bash

# Description: This script retries an API call to a REST URL using curl.
# It supports GET requests by default, with configurable max retries and delay.
# Usage: ./retry_api_call.sh <URL> [MAX_RETRIES] [SLEEP_SECONDS]
# Example: ./retry_api_call.sh https://api.example.com/data 3 2

# Check if URL is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <URL> [MAX_RETRIES] [SLEEP_SECONDS]" >&2
    exit 1
fi

# Assign arguments to variables
URL="$1"
MAX_RETRIES="${2:-5}"  # Default to 5 retries if not provided
SLEEP_SECONDS="${3:-5}"  # Default to 5 seconds delay if not provided

# Function to perform the API call and check response
call_api() {
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")
    if [ "$RESPONSE" -eq 200 ]; then  # Assuming success on HTTP 200; adjust as needed
        return 0  # Success
    else
        return 1  # Failure
    fi
}

# Retry loop
ATTEMPT=1
while [ $ATTEMPT -le $MAX_RETRIES ]; do
    echo "Attempt $ATTEMPT: Calling $URL..."

    # Call the API
    if call_api; then
        echo "Success! HTTP Status: $RESPONSE"
        # Here you can add code to handle the actual response, e.g., curl -s "$URL"
        curl -s "$URL"  # Output the successful response
        exit 0  # Exit successfully
    else
        echo "Failed with HTTP Status: $RESPONSE. Retrying after $SLEEP_SECONDS seconds..."
        sleep "$SLEEP_SECONDS"
    fi

    ATTEMPT=$((ATTEMPT + 1))
done

# If all retries fail
echo "API call failed after $MAX_RETRIES attempts." >&2
exit 1
