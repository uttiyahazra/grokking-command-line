# Write a Python script to handle JSON configuration files in DevOps, such as loading deployment settings or saving pipeline results. Usage: Run the script with `python config_loader.py` to load a sample JSON and print it.

import json
import os

# Sample JSON data (could be from a file)
sample_config = '{"app": "myapp", "version": "1.0", "env": "prod"}'

# Parse JSON string to dict
config_dict = json.loads(sample_config)
print(f"Loaded config: {config_dict}")

# Write to a file
config_file = 'config.json'
with open(config_file, 'w') as f:
    json.dump(config_dict, f, indent=4)  # Dump with indentation for readability
print(f"Saved config to {config_file}")

# Load from file
if os.path.exists(config_file):
    with open(config_file, 'r') as f:
        loaded_config = json.load(f)
    print(f"Reloaded config: {loaded_config}")