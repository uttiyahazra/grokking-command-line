# 🔍 Python `re` Module — DevOps Handy Snippets

> *"Regex is the scalpel for text; the `re` module lets DevOps engineers slice through logs, parse complex configs, and sanitize sensitive data with surgical precision."*

---

## 🔑 Basic Setup

```python
import re
```
Regular expressions use a specialized syntax to define search patterns. In Python, the `re` module provides the engine to execute these patterns against strings.



---

## 📂 Match & Search

In log processing, `search` is your primary tool to find status keywords or extract specific identifiers.

```python
import re

line = "ERROR: Service nginx failed at 12:01"

# 1. Simple Keyword Search
if re.search(r"ERROR", line):
    print("🚨 Error detected in log stream")

# 2. Pattern Extraction (using Capture Groups)
match = re.search(r"Service (\w+)", line)
if match:
    # group(1) refers to the first set of parentheses (\w+)
    print(f"Impacted Service: {match.group(1)}")
```

---

## 🛠️ Finding All Matches

Perfect for auditing logs to collect every instance of a specific event (e.g., all logged-in users).

```python
import re

log = "User alice logged in, User bob logged out, User charlie logged in"

# Returns a list of all substrings matching the group
users = re.findall(r"User (\w+)", log)
print(f"Audit Trail Users: {', '.join(users)}") 
# Output: alice, bob, charlie
```

---

## 🔗 Replacing & Masking Patterns

Crucial for DevSecOps to ensure secrets or PII (Personally Identifiable Information) don't end up in plain-text logs or monitoring dashboards.



```python
import re

config = "db_user=admin db_pass=SuperSecret123"

# Mask any non-whitespace characters after 'db_pass='
secure_config = re.sub(r"db_pass=\S+", "db_pass=****", config)
print(secure_config) 
# Output: db_user=admin db_pass=****
```

---

## 📈 Parsing Delimited Logs

When logs don't use standard delimiters (like a mix of pipes, spaces, and colons), `re.split` is more robust than the standard `.split()`.

```python
import re

line = "INFO|2026-01-18|Service:nginx|Status:Started"
# Split by either a pipe or a colon
parts = re.split(r"[|:]", line)
print(parts) 
# Output: ['INFO', '2026-01-18', 'Service', 'nginx', 'Status', 'Started']
```

---

## 🧮 IP Address & Validation

Validating infrastructure components like IP addresses or Kubernetes resource names ensures your automation doesn't trigger API errors.

```python
import re

# 1. IP Address Extraction
log_entry = "Connection refused from 192.168.1.45 on port 80"
ip_match = re.search(r"\b\d{1,3}(\.\d{1,3}){3}\b", log_entry)
if ip_match:
    print(f"Source IP: {ip_match.group()}")

# 2. Strict Input Validation (using ^ and $)
pod_name = "nginx-deployment-v1"
# K8s naming: alphanumeric and hyphens only
if re.match(r"^[a-z0-9]([-a-z0-9]*[a-z0-9])?$", pod_name):
    print("✅ Valid Kubernetes Resource Name")
```

---

## 🧠 Critical Nuances

* **Raw Strings (`r""`)**: Always prefix your patterns with `r`. This treats backslashes literally, which is essential for regex sequences like `\d` or `\w`.
* **Search vs. Match**: `re.match()` checks only at the **start** of the string. `re.search()` checks **anywhere** in the string.
* **Greediness**: By default, `.*` is greedy (matches as much as possible). Use `.*?` for non-greedy matching (matches the smallest possible string).
* **Compiled Regex**: For high-volume log processing (millions of lines), use `pattern = re.compile(r"...")` to speed up repeated searches.

---

## 🛠️ Demo Snippets

### Log Timestamp Extractor
```python
import re

log = "2026-01-19 03:45:01 WARN: Disk latency high"
# Matches YYYY-MM-DD HH:MM:SS
ts = re.search(r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}", log)
if ts:
    print(f"Event Time: {ts.group()}")
```

### Multiline Error Scanner
```python
import re

log_data = """
INFO: Start
ERROR: DB Connection Timeout
INFO: Retrying...
ERROR: Access Denied
"""

# Find all lines starting with ERROR
errors = re.findall(r"^ERROR:.*", log_data, re.MULTILINE)
for err in errors:
    print(f"Found Critical: {err}")
```

---

## 🎯 Quick Mnemonics
* **`re.search()`** → Find first instance (anywhere).
* **`re.findall()`** → Get all instances as a list.
* **`re.sub()`** → Find and Replace (Masking).
* **`\d`** → Digit, **`\w`** → Word char, **`\s`** → Space.
* **`^`** → Start, **`$`** → End of string.
