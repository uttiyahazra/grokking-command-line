# ⚙️ Python `subprocess` Module — DevOps Handy Snippets

> *"Subprocess bridges Python with the shell — essential for orchestration, deployments, and executing the legacy CLI tools that power the internet."*

---

## 🔑 Basic Setup

```python
import subprocess
```
The `subprocess` module allows you to spawn new processes, connect to their input/output/error pipes, and obtain their return codes. It is the modern replacement for older modules like `os.system` and `os.spawn`.



---

## 📂 Run Simple Command

The `run()` function is the recommended approach for most use cases. It waits for the command to complete.

```python
import subprocess

# capture_output=True: saves results to result.stdout/stderr
# text=True: returns results as strings instead of bytes
result = subprocess.run(["ls", "-l"], capture_output=True, text=True)

print(result.stdout)
```

---

## 🛠️ Monitoring Service Status

In DevOps, we often wrap system commands to check the health of a cluster or service.

```python
import subprocess

# Run command and capture output
result = subprocess.run(["systemctl", "is-active", "nginx"], capture_output=True, text=True)
status = result.stdout.strip()

if status == "active":
    print("✅ Nginx is running")
else:
    print(f"❌ Nginx status: {status}")
```

---

## 🔗 Error Handling & Safety

Use `check=True` to automatically raise an exception if the command returns a non-zero exit code. This prevents your automation from proceeding on a failed step.



```python
import subprocess

try:
    # If docker is not installed or the daemon is down, this raises an error
    subprocess.run(["docker", "ps"], check=True, capture_output=True)
except subprocess.CalledProcessError as e:
    print(f"❌ Command failed with exit code {e.returncode}")
    print(f"Error Details: {e.stderr.decode()}")
```

---

## 📈 Background Processes (`Popen`)

For long-running tasks or when you need to interact with a process while it runs, use the `Popen` class.

```python
import subprocess

# Start a process in the background
proc = subprocess.Popen(["ping", "-c", "4", "google.com"], 
                        stdout=subprocess.PIPE, 
                        stderr=subprocess.PIPE)

# Do other work here...

# Wait and get the output
out, err = proc.communicate()
print(out.decode())
```

---

## 🧮 Pipeline Execution (The Pythonic Way)

You can replicate shell piping (e.g., `ps aux | grep nginx`) by connecting the `stdout` of one process to the `stdin` of another.

```python
import subprocess

# ps aux
ps = subprocess.Popen(["ps", "aux"], stdout=subprocess.PIPE)

# grep nginx (taking input from ps.stdout)
grep = subprocess.Popen(["grep", "nginx"], stdin=ps.stdout, stdout=subprocess.PIPE)

# Allow ps to receive a SIGPIPE if grep exits
ps.stdout.close() 

out, _ = grep.communicate()
print(out.decode())
```

---

## 🧠 Critical Nuances

* **List vs String:** Always pass commands as a **list** (`["ls", "-l"]`) rather than a string. This avoids shell injection vulnerabilities and handles spaces in filenames correctly.
* **`shell=True`**: Avoid using `shell=True` unless absolutely necessary (e.g., for built-in shell features like environment variable expansion). It is a significant security risk if user input is involved.
* **Timeouts:** Use the `timeout` parameter in `run()` to prevent a hung command from blocking your entire pipeline.
    `subprocess.run(["backup_script.sh"], timeout=300)`

---

## 🛠️ Demo Snippets

### Infrastructure Deployment
```python
def deploy_k8s():
    print("Applying Kubernetes manifests...")
    subprocess.run(["kubectl", "apply", "-f", "deployment.yaml"], check=True)
```

### Disk Usage Audit
```python
def check_disk():
    result = subprocess.run(["df", "-h", "/"], capture_output=True, text=True)
    print("Root Disk Status:")
    print(result.stdout)
```

### Log Scraper
```python
def get_recent_logs(lines=20):
    cmd = ["tail", "-n", str(lines), "/var/log/syslog"]
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.stdout
```

---

## 🎯 Quick Mnemonics
* **`run()`** → Synchronous (Wait).
* **`Popen()`** → Asynchronous (Background).
* **`capture_output`** → Store the result.
* **`check=True`** → Crash on error (Recommended).
* **`text=True`** → Get strings, not bytes.

