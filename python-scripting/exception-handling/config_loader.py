#Write a Python script to safely load a YAML config file with exception handling

import yaml

try:
    with open("config.yaml") as f:
        config = yaml.safe_load(f)
        print("Config loaded:", config)
except FileNotFoundError:
    print("❌ Config file missing")
except yaml.YAMLError as e:
    print(f"❌ Invalid YAML format: {e}")
except Exception as e:
    print(f"❌ Unexpected error: {e}")
finally:
    print("Config load attempt finished")
