#Write a bash script to perform resource usage calculations with math expressions (DevOps task demo)

#!/bin/bash

# This script simulates monitoring CPU and memory usage
# and calculates thresholds using Bash arithmetic expressions.

# Example input arguments:
# $1 = total CPU cores
# $2 = total memory (GB)

if [ $# -ne 2 ]; then
    echo "Usage: $0 <cpu_cores> <memory_gb>"
    exit 1
fi

CPU_CORES=$1
MEMORY_GB=$2

echo "System resources: $CPU_CORES cores, $MEMORY_GB GB RAM"

# Calculate recommended thread pool size (2 threads per core)
THREAD_POOL_SIZE=$(( CPU_CORES * 2 ))
echo "Recommended thread pool size: $THREAD_POOL_SIZE"

# Calculate safe memory allocation (80% of total memory)
SAFE_MEMORY=$(( MEMORY_GB * 80 / 100 ))
echo "Safe memory allocation: $SAFE_MEMORY GB"

# Demonstrate increment/decrement
TASKS=5
echo "Initial tasks: $TASKS"
TASKS=$(( TASKS + 3 ))
echo "After adding tasks: $TASKS"
TASKS=$(( TASKS - 2 ))
echo "After completing tasks: $TASKS"

# Demonstrate modulus (useful for batch scheduling)
BATCH_SIZE=4
REMAINDER=$(( TASKS % BATCH_SIZE ))
echo "Tasks remaining after full batches of $BATCH_SIZE: $REMAINDER"

# Exit code based on threshold check
if [ $SAFE_MEMORY -lt 2 ]; then
    echo "Warning: Safe memory allocation too low!"
    exit 2
else
    echo "Resource calculation completed successfully."
    exit 0
fi
