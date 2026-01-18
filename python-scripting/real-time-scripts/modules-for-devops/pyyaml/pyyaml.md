# 📜 Python `PyYAML` Module — DevOps Handy Snippets

> *"YAML powers configurations in Kubernetes, Ansible, and CI/CD pipelines; the `PyYAML` library allows you to parse, modify, and generate these manifests programmatically."*

---

## 🔑 Basic Setup

`PyYAML` is the industry standard for handling YAML in Python. It must be installed via pip.

```bash
pip install pyyaml
```

```python
import yaml
```

---

## 📂 Loading YAML Configurations

In DevOps, we use YAML to define environment variables, replica counts, and resource limits.



```python
import yaml

with open("config.yaml", "r") as f:
    # safe_load prevents execution of arbitrary code within YAML files
    config = yaml.safe_load(f)

print(f"Target Environment: {config['env']}")
print(f"Replica Count: {config['replicas']}")
```

---

## 🛠️ Generating YAML Configs

Use this to dynamically generate configuration files for different environments (Dev/Stage/Prod) during automation tasks.

```python
import yaml

config = {
    "env": "production",
    "replicas": 5,
    "services": ["nginx", "redis", "postgres"]
}

with open("output_config.yaml", "w") as f:
    # default_flow_style=False ensures the output is "block" style (standard YAML)
    yaml.safe_dump(config, f, default_flow_style=False)

print("Manifest generated successfully.")
```

---

## 🔗 Working with Kubernetes Manifests

Kubernetes manifests are deeply nested. PyYAML makes it easy to drill down into the spec or metadata.



```python
import yaml

with open("deployment.yaml") as f:
    manifest = yaml.safe_load(f)

# Extracting specific values
name = manifest["metadata"]["name"]
image = manifest["spec"]["template"]["spec"]["containers"][0]["image"]

print(f"Deployment: {name} | Image: {image}")
```

---

## 📈 Multiple Documents in One File

Kubernetes and Ansible often combine multiple resources (e.g., a Service and a Deployment) into a single file separated by `---`.

```python
import yaml

with open("k8s_stack.yaml") as f:
    # safe_load_all returns a generator for all documents in the file
    docs = yaml.safe_load_all(f)
    
    for doc in docs:
        if doc: # Check if doc is not empty
            print(f"Processing Resource: {doc['kind']} - {doc['metadata']['name']}")
```

---

## 🧹 Error Handling & Validation

Malformed indentation is the #1 cause of YAML errors. Always wrap your loaders in a try-except block to catch syntax issues before they hit your pipeline.

```python
import yaml

try:
    with open("invalid_config.yaml") as f:
        config = yaml.safe_load(f)
except yaml.YAMLError as e:
    print(f"❌ YAML Syntax Error: {e}")
```

---

## 🧠 Critical Nuances

* **Security (Important):** Always use `yaml.safe_load()` instead of `yaml.load()`. The latter can be exploited to execute arbitrary Python code embedded in a YAML file.
* **Indentation:** Python dictionaries are unordered (in older versions), but PyYAML preserves order in modern Python. However, YAML output indentation is strictly 2 spaces by default.
* **Flow Style:** Set `default_flow_style=False` in `dump()` to avoid getting JSON-like output (using curly braces) inside your YAML file.

---

## 🛠️ Demo Snippets

### Dynamic K8s Manifest Generator
```python
def create_deployment(name, image, replicas):
    deployment = {
        "apiVersion": "apps/v1",
        "kind": "Deployment",
        "metadata": {"name": name},
        "spec": {
            "replicas": replicas,
            "template": {
                "spec": {
                    "containers": [{"name": "app", "image": image}]
                }
            }
        }
    }
    with open(f"{name}-deploy.yaml", "w") as f:
        yaml.safe_dump(deployment, f, default_flow_style=False)

create_deployment("api-gateway", "nginx:1.21", 3)
```

### Multi-Doc Audit Tool
```python
with open("infrastructure.yaml") as f:
    resources = list(yaml.safe_load_all(f))
    print(f"Total resources found: {len(resources)}")
    
    for res in resources:
        kind = res.get("kind")
        name = res.get("metadata", {}).get("name")
        print(f"Resource: [{kind}] Name: {name}")
```

---

## 🎯 Quick Mnemonics
* **`safe_load()`** → File to Python Dict.
* **`safe_dump()`** → Python Dict to File.
* **`safe_load_all()`** → Handle files with `---` separators.
* **`default_flow_style=False`** → Keep it looking like standard YAML.
