#Write a Python script to check system load and print alerts using if-elif-else statements

import os

load = os.getloadavg()[0]  # 1-minute load average

if load < 1.0:
    print("System load is normal")
elif load < 5.0:
    print("System load is moderate")
else:
    print("System load is high! Investigate immediately")
