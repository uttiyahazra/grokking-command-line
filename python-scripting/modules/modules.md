# 📦 Python Modules — Quick Reference

> *"Modules are the scaffolding of Python projects; they organize code into reusable, maintainable units."*

---

## 🔑 Basic Syntax

```python
# Importing a module
import module_name

# Import with alias (standard for long names)
import module_name as alias

# Import specific objects (cleaner namespace)
from module_name import function, Class

# Import all (⚠️ Not recommended: leads to naming conflicts)
from module_name import *
```
- **`import`**: Brings the module's namespace into your current script.
- **`as`**: Creates a shorthand (e.g., `import subprocess as sp`).
- **`from ... import ...`**: Imports specific pieces without needing to prefix them later.

---

## 📦 Creating a Module & Package

Any `.py` file is a module. A **package** is a directory that contains multiple modules and an `__init__.py` file.



**Example: `utils.py` (The Module)**
```python
def greet(name):
    return f"Hello, {name}"
```

**Usage in `main.py`:**
```python
import utils
print(utils.greet("Uttiya"))
```

**Package Structure:**
```text
myproject/
    __init__.py
    utils.py
    services/
        __init__.py
        api.py
```
**Importing from the package:**
```python
from myproject.services import api
api.call_endpoint()
```

---

## 🔗 Standard & Third-Party Modules

### Essential Standard Library
| Module | DevOps Use Case |
| :--- | :--- |
| **`os`** | File operations and environment variables. |
| **`sys`** | Accessing command-line arguments (`sys.argv`). |
| **`subprocess`** | Running shell commands (`ls`, `docker`, `kubectl`). |
| **`pathlib`** | Object-oriented filesystem path manipulation. |
| **`json` / `yaml`** | Parsing configuration files and API payloads. |

### Third-Party Modules (via `pip`)
Installed using: `pip install requests`
```python
import requests
r = requests.get("[https://api.github.com](https://api.github.com)")
print(r.status_code)
```

---

## 🧠 Critical Nuances

### 1. Module Search Path (`sys.path`)
When you run `import`, Python looks in this order:
1. The directory containing the input script.
2. `PYTHONPATH` (if set).
3. Installation-dependent default paths (Standard Library).
4. `site-packages` (Third-party libraries).



### 2. Relative vs. Absolute Imports
- **Absolute:** `import myproject.utils` (Clearer and preferred).
- **Relative:** `from . import utils` (Used within packages to refer to sibling modules).

### 3. Reloading Modules
If you are in an interactive session (REPL) and change a module file, Python won't see the changes unless you reload:
```python
import importlib, utils
importlib.reload(utils)
```

---

## 🛠️ Demo Snippets

### Organizing Imports (Best Practice)
```python
# 1. Standard library imports
import os
import sys

# 2. Third-party imports
import requests
import yaml

# 3. Local application imports
from my_tool import scanner
```

### Path Manipulation with `pathlib`
```python
from pathlib import Path

# Get the directory of the current script
base_dir = Path(__file__).resolve().parent
config_path = base_dir / "config" / "settings.yaml"
print(f"Loading: {config_path}")
```

### Running Commands via `subprocess`
```python
import subprocess

def check_disk_usage():
    result = subprocess.run(["df", "-h"], capture_output=True, text=True)
    return result.stdout

print(check_disk_usage())
```
