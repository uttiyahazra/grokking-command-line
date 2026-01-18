#Write a Python script to iterate over critical services and check their systemd status using a for loop

import subprocess

services = ["nginx", "docker", "redis"]

for svc in services:
    result = subprocess.run(["systemctl", "is-active", svc], capture_output=True, text=True)
    status = result.stdout.strip()
    print(f"Service {svc}: {status}")
