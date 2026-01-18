# ⚙️ Python `os` Module — DevOps Handy Snippets

> *"The `os` module is the Swiss army knife for system automation, providing a portable way of using operating system-dependent functionality."*

---

## 🔑 Environment Variables

Interacting with the shell environment is a core DevOps task.
```python
import os

# Set environment variable for the current process
os.environ["DEPLOY_ENV"] = "production"

# Get environment variable with a safe fallback
env = os.getenv("DEPLOY_ENV", "development")

print(f"Deployment environment: {env}")
```

---

## 📂 Directory & File Operations



```python
import os

# Get and Change Working Directory
print("Current Working Directory:", os.getcwd())
os.chdir("/tmp")

# Create nested directories (mkdir -p)
os.makedirs("/opt/app/logs", exist_ok=True)

# List all entries in a directory
for entry in os.listdir("/var/log"):
    print(f"Found log entry: {entry}")
```

---

## 💾 Disk Usage Monitoring
Python can query the file system to monitor disk health without calling external shell commands.
```python
import os

stats = os.statvfs("/")
total = stats.f_frsize * stats.f_blocks
free = stats.f_frsize * stats.f_bfree
used_percent = (1 - free/total) * 100

print(f"Root disk usage: {used_percent:.2f}%")
```

---

## 🔗 Process Management
Manage PIDs and process signals directly from your scripts.
```python
import os

print("Current PID:", os.getpid())
print("Parent PID:", os.getppid())

# Sending signals (e.g., SIGKILL to a process ID 1234)
# os.kill(1234, 9) 
```

---

## 🔒 Permissions & Ownership
Metadata retrieval is essential for audit scripts.
```python
import os, pwd, grp

file_path = "/etc/passwd"
stat_info = os.stat(file_path)

# Resolve UID/GID to human-readable names
owner = pwd.getpwuid(stat_info.st_uid).pw_name
group = grp.getgrgid(stat_info.st_gid).gr_name
perms = oct(stat_info.st_mode)[-3:]

print(f"{file_path}: Owner={owner}, Group={group}, Perms={perms}")
```

---

## 🛠️ PATH & Executable Validation
Verify that required tools are installed and executable before starting a pipeline.
```python
import os

executables = ["docker", "kubectl", "terraform"]
path_dirs = os.getenv("PATH").split(os.pathsep)

for exe in executables:
    found = False
    for folder in path_dirs:
        full_path = os.path.join(folder, exe)
        if os.access(full_path, os.X_OK):
            print(f"✅ {exe} found at {full_path}")
            found = True
            break
    if not found:
        print(f"❌ {exe} not found in PATH")
```

---

## 🚦 Signal Handling & Resource Limits

### 1. Resource Limits (File Descriptors)
```python
import resource

soft, hard = resource.getrlimit(resource.RLIMIT_NOFILE)
print(f"FD limits: soft={soft}, hard={hard}")

# Increase soft limit for high-concurrency tasks
resource.setrlimit(resource.RLIMIT_NOFILE, (1024, hard))
```

### 2. Graceful Shutdown (Signal Handling)

```python
import os, signal, time

def handle_sigterm(signum, frame):
    print("\nReceived SIGTERM — cleaning up and shutting down...")
    exit(0)

signal.signal(signal.SIGTERM, handle_sigterm)
print(f"Service running... PID: {os.getpid()}")

while True:
    time.sleep(1)
```

---

## 🎯 Quick Mnemonics
* **`os.getenv`** → Read env vars.
* **`os.makedirs`** → Recursive directory creation.
* **`os.path.join`** → Platform-independent path construction.
* **`os.stat`** → File metadata (owner, perms).
* **`os.kill`** → Signal delivery to processes.
* **`os.statvfs`** → Disk capacity statistics.
