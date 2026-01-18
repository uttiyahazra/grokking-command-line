#Write a bash script that checks if required environment variables (e.g., for a deployment) are set. If any are missing, it exits with an error. 
#Common in CI/CD pipelines to prevent deployment failures.

#!/bin/bash

# List of required environment variables
REQUIRED_VARS=("DB_HOST" "DB_USER" "DB_PASS")

# Flag to track if all variables are set
ALL_SET=true

# Iterate through required variables (using a for loop internally, but main logic is if)
for VAR in "${REQUIRED_VARS[@]}"; do
    if [ -z "${!VAR}" ]; then  # Check if variable is empty
        echo "Error: Environment variable $VAR is not set." >&2
        ALL_SET=false
    fi
done

# Final check after loop
if ! $ALL_SET; then
    echo "Deployment aborted due to missing variables." >&2
    exit 1
else
    echo "All required variables are set. Proceeding with deployment..."
    # Add deployment commands here, e.g., kubectl apply -f deployment.yaml
fi