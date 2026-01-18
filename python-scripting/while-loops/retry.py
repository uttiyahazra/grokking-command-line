#Write a Python script to retry connecting to a service until success using a while loop

import random

attempts = 0
connected = False

while not connected and attempts < 5:
    print(f"Attempt {attempts+1}: Connecting...")
    connected = random.choice([True, False])  # simulate success/failure
    attempts += 1

if connected:
    print("Connection established")
else:
    print("Failed to connect after 5 attempts")
