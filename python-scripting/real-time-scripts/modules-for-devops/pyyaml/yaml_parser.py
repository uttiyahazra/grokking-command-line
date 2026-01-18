# Write a Python script to parse YAML configuration files in DevOps, such as Kubernetes manifests or CI/CD pipelines. Usage: Install pyyaml via pip if needed, then run `python yaml_parser.py` to load a sample YAML.

import yaml  # From pyyaml package

# Sample YAML data (could be from a file)
sample_yaml = """
app:
  name: myapp
  version: 1.0
env: prod
"""

# Load YAML to dict
config_dict = yaml.safe_load(sample_yaml)  # safe_load prevents arbitrary code execution
print(f"Loaded YAML config: {config_dict}")

# Dump dict to YAML string
dumped_yaml = yaml.safe_dump(config_dict, default_flow_style=False)  # Nicely formatted
print("Dumped YAML:")
print(dumped_yaml)

# Write to file
with open('config.yaml', 'w') as f:
    yaml.safe_dump(config_dict, f)
print("Saved to config.yaml")