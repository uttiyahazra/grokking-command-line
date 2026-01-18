# 📑 Python `json` Module — DevOps Handy Snippets

> *"JSON is the lingua franca of configs and APIs; the `json` module makes it effortless to parse and produce structured data for modern automation."*

---

## 🔑 Basic Usage



```python
import json

# Convert Python dict → JSON string (Serialization)
data = {"env": "prod", "replicas": 3}
json_str = json.dumps(data)
print(json_str)  # {"env": "prod", "replicas": 3}

# Convert JSON string → Python dict (Deserialization)
parsed = json.loads(json_str)
print(parsed["env"])  # prod
```
- **`dumps`**: "**D**ump **S**tring" (Python to String).
- **`loads`**: "**L**oad **S**tring" (String to Python).

---

## 📂 File Operations

In DevOps, JSON is primarily used for configuration files (`config.json`) and infrastructure manifests.

### 1. Read Config from File
```python
import json

with open("config.json", "r") as f:
    config = json.load(f)

print(f"Deploying to {config['env']} with {config['replicas']} replicas")
```

### 2. Write/Update Config to File
```python
import json

config = {"env": "staging", "replicas": 2}

with open("config.json", "w") as f:
    # indent=4 makes the file human-readable (pretty-print)
    json.dump(config, f, indent=4)

print("Config written successfully")
```

---

## 🔗 API and Log Integration

### Parsing API Responses
Most modern tools (GitHub API, AWS, Kubernetes) return JSON. The `requests` library even provides a built-in shortcut.
```python
import requests

resp = requests.get("[https://api.github.com/repos/python/cpython](https://api.github.com/repos/python/cpython)")
data = resp.json()  # Automatically calls json.loads()

print(f"Repo: {data['full_name']} | Stars: {data['stargazers_count']}")
```

### Processing Structured Logs
Cloud-native apps often log in JSON format for easier ingestion by ELK or Splunk.
```python
import json

log_line = '{"level":"ERROR","msg":"Service failed","code":500}'
entry = json.loads(log_line)

if entry["level"] == "ERROR":
    print(f"⚠️ Alert: {entry['msg']} (Error Code: {entry['code']})")
```

---

## 🧮 Debugging and "Pretty Printing"
When debugging complex nested JSON, use the `indent` and `sort_keys` parameters to make the output readable.
```python
import json

data = {
    "env": "prod",
    "services": ["nginx", "docker", "redis"],
    "version": 1.2
}

print(json.dumps(data, indent=2, sort_keys=True))
```

---

## 🔒 Safe Handling & Validation

Malformed JSON will crash your script. Always wrap parsing in a `try/except` block and use `.get()` for dictionary access to avoid `KeyError`.

```python
import json

raw_input = "invalid-json-data"

try:
    parsed = json.loads(raw_input)
    # Safe access with fallback
    env = parsed.get("env", "unknown")
except json.JSONDecodeError as e:
    print(f"❌ Failed to parse JSON: {e}")
```

---

## 🎯 Quick Mnemonics
* **`json.dumps()`** → Python Object **to** String.
* **`json.loads()`** → String **to** Python Object.
* **`json.dump()`** → Python Object **to** File.
* **`json.load()`** → File **to** Python Object.

---

## 🛠️ Demo Snippets

### Dynamic Replica Updater
```python
def update_replicas(file_path, count):
    with open(file_path, "r") as f:
        cfg = json.load(f)
    
    cfg["replicas"] = count
    
    with open(file_path, "w") as f:
        json.dump(cfg, f, indent=4)

update_replicas("deploy.json", 5)
```

### Monitoring Event Parser
```python
import json

def process_event(json_event):
    event = json.loads(json_event)
    status = event.get("status", "unknown")
    service = event.get("service", "unknown")
    
    if status == "down":
        return f"CRITICAL: Service {service} is DOWN"
    return f"Status for {service}: {status}"

print(process_event('{"service":"nginx","status":"down"}'))
```
