# 📦 Python `shutil` Module — DevOps Handy Snippets

> *"Shutil (Shell Utilities) simplifies high-level file operations—essential for backups, deployments, and automated housekeeping in DevOps pipelines."*

---

## 🔑 Basic Setup

```python
import shutil
```
While the `os` module handles low-level system calls, `shutil` provides a high-level interface for moving, copying, and archiving files and directories.

---

## 📂 Copying Files & Directories

In DevOps, this is your primary tool for backing up configurations or replicating environments.



```python
import shutil

# 1. Copy single file (content and permissions only)
shutil.copy("/etc/config.yaml", "/opt/app/config.yaml")

# 2. Copy with full metadata (mtime, ctime, and metadata)
# Use this for identical backups
shutil.copy2("/etc/config.yaml", "/opt/app/config.yaml")

# 3. Copy entire directory tree (Recursive)
# Great for staging a new release from a template
shutil.copytree("/opt/app/v1", "/opt/app/v1_backup")
```

---

## 🛠️ Move & Rename

Used to archive old configuration versions or reorganize directory structures during a CI/CD process.

```python
import shutil

# Move file or directory (Atomic if on the same filesystem)
shutil.move("/opt/app/config.yaml", "/opt/app/config_backup.yaml")
```

---

## 🔗 Removing Directories

Handle directory cleanup with a single command. **Caution:** This is a permanent, recursive deletion.

```python
import shutil

# Equivalent to 'rm -rf'
shutil.rmtree("/opt/app/tmp")
```

---

## 📈 Disk Usage Monitoring

Quickly check if a partition has enough space before initiating a large deployment or backup.



```python
import shutil

usage = shutil.disk_usage("/")

print(f"Total: {usage.total/1024**3:.2f} GB")
print(f"Used: {usage.used/1024**3:.2f} GB")
print(f"Free: {usage.free/1024**3:.2f} GB")

# DevOps logic: 
if (usage.free / usage.total) < 0.10:
    print("⚠️ Warning: Disk space below 10%!")
```

---

## 🧹 Archiving & Extraction

Package your application logs, source code, or configuration sets into compressed files for easier transfer or storage.

### Create Archives (Zip/Tar)
```python
import shutil

# Create tar.gz archive (gztar) of a directory
shutil.make_archive("/opt/backups/app_logs", "gztar", "/var/log/app")

# Create a standard ZIP archive
shutil.make_archive("/opt/backups/config_package", "zip", "/etc/app")
```

### Extract Archives
```python
import shutil

# Unpack an archive into a target directory
shutil.unpack_archive("/opt/backups/app_logs.tar.gz", "/tmp/log_analysis")
```

---

## 🧠 Critical Nuances

* **`copy` vs `copy2`**: Use `copy2` in DevOps if you need to preserve the "Modified" timestamps, which is often crucial for audit logs and synchronization checks.
* **`shutil.move` behavior**: If the destination is on a different disk, `shutil` will copy the file and then delete the original.
* **Error Handling**: `shutil.rmtree` will fail if a file is read-only. You can use the `ignore_errors=True` parameter or a custom error handler to force deletion.
* **Symlinks**: By default, `copytree` follows symlinks and copies the actual files. Set `symlinks=True` to copy the links themselves.

---

## 🛠️ Demo Snippets

### Atomic Release Rotation
```python
def rotate_release(version):
    # Archive current
    shutil.move("/opt/app/current", f"/opt/app/releases/v{version}")
    # Deploy new from staging
    shutil.copytree("/opt/staging/new_build", "/opt/app/current")
```

### Automated Log Compression
```python
import os

log_dir = "/var/log/nginx"
if shutil.disk_usage(log_dir).free < (5 * 1024**3): # 5GB
    shutil.make_archive(f"/nas/logs/nginx_{os.getpid()}", "gztar", log_dir)
    # Be careful with rmtree on system log dirs!
```

---

## 🎯 Quick Mnemonics
* **`copy2`** → Copy + Meta (The "2" is for "Double" info).
* **`copytree`** → Recursive directory copy.
* **`rmtree`** → Recursive directory removal.
* **`make_archive`** → Create Zip/Tar.
* **`disk_usage`** → Quick health check.
