# Write a Python script to monitor system resources in DevOps for alerting on high usage, such as CPU or memory thresholds. Usage: Run the script with `python resource_monitor.py` to print current system metrics.

import psutil

# Get CPU usage percentage (over 3 seconds interval for accuracy)
cpu_percent = psutil.cpu_percent(interval=1)
print(f"CPU Usage: {cpu_percent}%")

# Get memory usage
memory = psutil.virtual_memory()
print(f"Memory Usage: {memory.percent}% (Total: {memory.total / (1024**3):.2f} GB)")

# Get disk usage for root partition
disk = psutil.disk_usage('/')
print(f"Disk Usage: {disk.percent}% (Free: {disk.free / (1024**3):.2f} GB)")

# List running processes (top 5 by CPU)
processes = sorted(psutil.process_iter(['pid', 'name', 'cpu_percent']), key=lambda p: p.info['cpu_percent'], reverse=True)[:5]
print("Top 5 Processes by CPU:")
for proc in processes:
    print(f"PID: {proc.info['pid']}, Name: {proc.info['name']}, CPU: {proc.info['cpu_percent']}%")