#Write a Python script to check CPU and memory usage thresholds using if-elif-else statements

import psutil

cpu = psutil.cpu_percent(interval=1)
mem = psutil.virtual_memory().percent

if cpu < 50 and mem < 70:
    print(f"[OK] CPU={cpu}% MEM={mem}% — System healthy")
elif cpu < 80 or mem < 85:
    print(f"[WARN] CPU={cpu}% MEM={mem}% — System under moderate load")
else:
    print(f"[CRITICAL] CPU={cpu}% MEM={mem}% — Investigate immediately!")
