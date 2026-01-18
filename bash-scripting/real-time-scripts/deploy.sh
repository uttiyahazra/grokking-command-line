#Write a bash script that can perform actions based on provided deployment env argument (e.g. dev, staging, prod).
#Useful for CI/CD and ENV specific deployment automation.

#!/bin/bash

# Get environment from argument
ENV="${1:-dev}"  # Default to dev if no argument

# Case statement to handle different environments
case "$ENV" in
    dev)
        echo "Deploying to development environment."
        # Dev-specific commands, e.g., docker-compose up -d
        ;;
    staging)
        echo "Deploying to staging environment."
        # Staging-specific commands, e.g., kubectl apply -f staging.yaml
        ;;
    prod)
        echo "Deploying to production environment."
        # Prod-specific commands with extra checks
        read -p "Confirm production deployment? (y/n): " CONFIRM
        if [ "$CONFIRM" != "y" ]; then
            echo "Deployment aborted."
            exit 0
        fi
        # Proceed with prod deployment
        ;;
    *)
        echo "Unknown environment: $ENV. Supported: dev, staging, prod." >&2
        exit 1
        ;;
esac

echo "Deployment for $ENV completed."