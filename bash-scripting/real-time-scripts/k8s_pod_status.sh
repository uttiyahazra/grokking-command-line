#Write a bash script that can check all pods status in a user entered namespace & report if unhealthy.
#Handy for a k8s homelab setup.

#!/bin/bash
# Check status of all pods in a namespace

echo "Enter the namespace: "
read namespace

for pod in $(kubectl get pods -n "$namespace" --no-headers | awk '{print $1}'); do
  status=$(kubectl get pod "$pod" -n "$namespace" -o jsonpath='{.status.phase}')
  if [ "$status" != "Running" ]; then
    echo "Pod $pod is in $status state"
  else
    echo "Pod $pod is healthy"
  fi
done
