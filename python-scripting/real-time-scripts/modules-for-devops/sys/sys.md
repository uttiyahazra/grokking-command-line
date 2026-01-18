# 🖥️ Python `sys` Module — DevOps Handy Snippets

> *"The `sys` module provides a direct interface to the Python interpreter, giving DevOps engineers control over the runtime, system-specific constants, and environment interactions."*

---

## 🔑 Basic Setup

```python
import sys
```
While the `os` module focuses on the Operating System, `sys` is all about the **Python Runtime**. It is essential for handling inputs, outputs, and exit statuses in CI/CD pipelines.

---

## 📂 Command-Line Arguments

The `sys.argv` list is the simplest way to pass parameters like environment names, tags, or file paths into your automation scripts.



```python
import sys

# sys.argv[0] is always the script name itself
# Example run: python deploy.py production --force
print(f"Script Name: {sys.argv[0]}")

if len(sys.argv) > 1:
    env = sys.argv[1]
    print(f"🚀 Initializing deployment to: {env}")
else:
    print("⚠️ No environment specified, defaulting to 'staging'")
```

---

## 🛠️ Exit Codes (CI/CD Integration)

In DevOps, the exit code is the "language" of the pipeline. `0` tells the runner to continue; any non-zero value (usually `1`) triggers a pipeline failure.

```python
import sys

def run_health_check():
    # ... logic here ...
    return True

if run_health_check():
    print("✅ System healthy.")
    sys.exit(0) # Success: Pipeline continues
else:
    print("❌ Critical Failure.")
    sys.exit(1) # Failure: Pipeline stops and alerts
```

---

## 🔗 Standard Streams (stdout/stderr)

By using `stderr`, you ensure that error messages are visible even if someone redirects the standard output to a log file (`python script.py > output.log`).



```python
import sys

# Normal logging
sys.stdout.write("INFO: Connecting to cluster...\n")

# Critical error logging
sys.stderr.write("ERROR: Could not connect to Kubernetes API\n")
```

---

## 📈 Runtime & Path Management

### 1. System Audit
Ensure your automation is running on the correct version of Python or the correct OS platform.
```python
print(f"Python version: {sys.version}")
print(f"Platform: {sys.platform}")  # 'linux', 'darwin', or 'win32'
print(f"Executable: {sys.executable}") # Path to the python binary
```

### 2. Modifying Search Paths
If you have a shared library of DevOps utilities in a non-standard directory, you can inject it into the runtime.
```python
# Show where Python looks for modules
print(sys.path)

# Add custom library path
sys.path.append("/opt/devops/shared_modules")
```

---

## 🧮 Custom Exception Hooks

Centralize your error logging! Instead of wrapping everything in `try/except`, you can define a global handler for any uncaught errors.

```python
import sys

def deployment_error_handler(exc_type, exc_value, traceback):
    # Log the error to your monitoring system
    print(f"🔥 CRITICAL: {exc_type.__name__} occurred: {exc_value}")

sys.excepthook = deployment_error_handler

# This will now be handled by the hook above
raise RuntimeError("Database connection timed out during migration")
```

---

## 🧠 Critical Nuances

* **`sys.argv` vs `argparse`**: For simple one-off parameters, `sys.argv` is fine. For complex CLI tools with flags (e.g., `--user admin`), use the `argparse` module.
* **`sys.exit()` internally**: Calling `sys.exit()` actually raises a `SystemExit` exception, allowing cleanup code in `finally` blocks to execute.
* **`sys.platform` variations**: Be careful—macOS returns `darwin`, while various Linux distros all return `linux`.

---

## 🛠️ Demo Snippets

### CI/CD Environment Guard
```python
import sys

if sys.platform == "win32":
    print("❌ This automation script requires a Linux-based runner.")
    sys.exit(1)
```

### Memory Usage Audit
```python
import sys

# Get the memory size of an object in bytes
config_data = {"env": "prod", "version": "1.0.4", "replicas": 10}
print(f"Memory size of config: {sys.getsizeof(config_data)} bytes")
```

---

## 🎯 Quick Mnemonics
* **`sys.argv`** → Command-line inputs.
* **`sys.exit(0)`** → All good.
* **`sys.exit(1)`** → Stop the pipeline!
* **`sys.path`** → Where modules live.
* **`sys.stderr`** → For the red text/errors.
