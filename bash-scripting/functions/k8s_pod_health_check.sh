#Write a bash script to perform Kubernetes pod health check using functions (DevOps task demo)

#!/bin/bash

# Function to check pod status
check_pod() {
    POD_NAME=$1
    NAMESPACE=$2
    STATUS=$(kubectl get pod "$POD_NAME" -n "$NAMESPACE" -o jsonpath='{.status.phase}')
    echo "Pod $POD_NAME in namespace $NAMESPACE is $STATUS"
}

# Example usage
check_pod "web-app-123" "production"
check_pod "db-service-456" "production"
