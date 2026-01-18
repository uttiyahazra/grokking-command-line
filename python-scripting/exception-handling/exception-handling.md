# ⚠️ Python Exception Handling — Quick Reference

> *"Robust automation anticipates failure; exceptions are the safety net of Python scripting."*

---

## 🔑 Basic Syntax

```python
try:
    # risky commands
except ExceptionType as e:
    # handle specific error
else:
    # optional: runs ONLY if NO exception occurred
finally:
    # ALWAYS executed (cleanup tasks)
```
- **`try`**: Wraps the code that might fail (e.g., API calls, file I/O).
- **`except`**: Catches and processes specific errors so the script doesn't crash.
- **`else`**: Useful for logic that should only run if the `try` block was successful.
- **`finally`**: The "guaranteed" block. Use this to close database connections or file handles regardless of success or failure.



---

## 📦 Common Exception Types

| Exception | Triggered When... |
| :--- | :--- |
| **`ValueError`** | A function receives an argument of right type but inappropriate value. |
| **`TypeError`** | An operation is applied to an object of inappropriate type. |
| **`KeyError`** | A dictionary key is not found. |
| **`IndexError`** | A list index is out of range. |
| **`FileNotFoundError`** | A file or directory is requested but doesn't exist. |
| **`PermissionError`** | Trying to run an operation without adequate access rights. |
| **`ImportError`** | A `python` module cannot be located or loaded. |

---

## 🧮 Handling Exceptions Safely

### Specific vs. Global Catching
Avoid "bare" `except:` blocks. Always try to name the error you expect.
```python
try:
    with open("config.yaml") as f:
        data = f.read()
except FileNotFoundError:
    print("Config file missing - using defaults.")
except PermissionError:
    print("Insufficient permissions to read config.")
```

### The Catch-All (Use Sparingly)
If you must catch "anything else," use `Exception` to ensure you still have access to the error message.
```python
try:
    risky_operation()
except Exception as e:
    print(f"Unexpected error: {e}")
```

---

## 🧠 Critical Nuances

- **The `raise` Keyword:** You can manually trigger an exception if a business logic condition isn't met.
- **Re-raising:** Sometimes you want to log an error but still let the script fail. Use a bare `raise` inside an `except` block to propagate the original error.
- **Custom Exceptions:** You can create your own error types for your DevOps tools to make debugging easier.
    ```python
    class DeploymentError(Exception):
        """Custom error for CI/CD failures."""
        pass
    ```
- **Logging vs. Printing:** In automation, use `logging.error(e)` instead of `print(e)` so errors are captured in system journals.



---

## 🛠️ Demo Snippets

### Safe Network Requests
```python
import requests

try:
    r = requests.get("[https://api.internal.com/v1/deploy](https://api.internal.com/v1/deploy)")
    r.raise_for_status() # Triggers an exception for 4xx or 5xx codes
except requests.exceptions.RequestException as e:
    print(f"Deployment API unreachable: {e}")
    # trigger_rollback()
```

### File and Resource Cleanup
```python
try:
    f = open("web_logs.txt", "w")
    f.write("Analyzing traffic...")
    # Logic that might fail here
except OSError as e:
    print(f"Disk error: {e}")
finally:
    f.close()
    print("File handle closed.")
```

### Validation with Custom Errors
```python
def validate_env(env_name):
    valid_envs = ["dev", "staging", "prod"]
    if env_name not in valid_envs:
        raise ValueError(f"Invalid environment: {env_name}")

try:
    validate_env("sandbox")
except ValueError as e:
    print(f"Validation Failed: {e}")
```
