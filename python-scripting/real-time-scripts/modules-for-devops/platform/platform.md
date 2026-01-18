# 🖥️ Python `platform` Module — DevOps Handy Snippets

> *"Know your battlefield: the `platform` module helps DevOps scripts adapt to the underlying OS, hardware, and runtime environment with precision."*

---

## 🔑 Basic Setup

```python
import platform
```
The `platform` module is part of the Python Standard Library and is essential for cross-platform automation where scripts must behave differently on Linux, Windows, or macOS.

---

## 📂 System Identification



```python
import platform

print("System:", platform.system())        # e.g. 'Linux', 'Windows', 'Darwin'
print("Release:", platform.release())      # e.g. '5.15.0-1051-azure'
print("Version:", platform.version())      # OS build version string
print("Architecture:", platform.architecture())  # ('64bit', 'ELF')
```
**Usage:** Detect the OS type before running platform-specific shell commands or package managers.

---

## 🛠️ Python Runtime Info

Validate the environment your script is running in to ensure compatibility with specific Python features.

```python
import platform

print("Python Version:", platform.python_version())      # e.g. '3.10.12'
print("Implementation:", platform.python_implementation()) # e.g. 'CPython', 'PyPy'
print("Compiler:", platform.python_compiler())           # Compiler used to build Python
```

---

## 🔗 Node & Machine Info

Useful for inventory collection and labeling nodes in a cluster.

```python
import platform

print("Node:", platform.node())            # Hostname (FQDN on some systems)
print("Machine:", platform.machine())      # e.g. 'x86_64', 'arm64'
print("Processor:", platform.processor())  # Detailed CPU info
```

---

## 🧹 Conditional Execution (Cross-Platform)

This is the most common DevOps pattern for the `platform` module.

```python
import platform
import subprocess

current_os = platform.system()

if current_os == "Linux":
    subprocess.run(["systemctl", "status", "nginx"])
elif current_os == "Windows":
    subprocess.run(["sc", "query", "nginx"])
elif current_os == "Darwin": # macOS
    subprocess.run(["brew", "services", "info", "nginx"])
else:
    print(f"Unsupported OS: {current_os}")
```

---

## 🧮 Advanced Linux Discovery

Modern Linux systems follow the freedesktop.org standard for OS identification.

```python
import platform

try:
    # Available in Python 3.10+
    info = platform.freedesktop_os_release()
    print(f"Distro: {info['NAME']} {info['VERSION_ID']}")
except AttributeError:
    print("Standard release info not found (Older Python/OS)")
```

---

## 🧠 Critical Nuances

- **`platform.system()` vs `os.name`**: `platform.system()` gives a human-readable name like 'Linux', whereas `os.name` gives a lower-level name like 'posix' or 'nt'.
- **Bitness**: `platform.architecture()` might return information based on the Python executable's bitness, not necessarily the OS's bitness.
- **Portability**: Use `platform.node()` instead of `os.uname()[1]` because `os.uname()` is not available on Windows.

---

## 🛠️ Demo Snippets

### Deployment Guard
Place this at the top of your scripts to prevent execution on incompatible environments.
```python
import platform
import sys

if platform.system() != "Linux":
    print("❌ Critical Error: This deployment script requires a Linux environment.")
    sys.exit(1)
```

### CI/CD Metadata Collection
```python
def get_system_metadata():
    return {
        "hostname": platform.node(),
        "os_type": platform.system(),
        "kernel": platform.release(),
        "cpu_arch": platform.machine(),
        "python_env": platform.python_version()
    }

print(get_system_metadata())
```

---

## 🎯 Quick Mnemonics
* **`platform.system()`** → OS name (Linux/Windows).
* **`platform.node()`** → Hostname.
* **`platform.machine()`** → Hardware (x86_64/arm).
* **`platform.platform()`** → One-line system summary.
* **`platform.python_version()`** → Check script requirements.
