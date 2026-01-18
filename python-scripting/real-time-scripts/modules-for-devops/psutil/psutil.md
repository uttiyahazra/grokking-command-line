# ⚡ Python `psutil` Module — DevOps Handy Snippets

> *"Psutil (process and system utilities) gives DevOps engineers deep visibility into system health and processes, providing a Pythonic interface for resource monitoring."*

---

## 🔑 Basic Setup

Unlike standard library modules, `psutil` must be installed. It is cross-platform and works on Linux, Windows, and macOS.

```bash
pip install psutil
```

```python
import psutil
```

---

## 📂 CPU Monitoring



```python
import psutil

# Get CPU usage as a percentage over a 1-second interval
print("CPU percent:", psutil.cpu_percent(interval=1))

# Count cores (Logical vs Physical)
print("Logical CPU cores:", psutil.cpu_count(logical=True))
print("Physical CPU cores:", psutil.cpu_count(logical=False))

# Breakdown of CPU times (user, system, idle)
print("CPU times:", psutil.cpu_times())
```

---

## 💾 Memory Monitoring

Essential for ensuring that your application containers or servers aren't hitting Out-Of-Memory (OOM) limits.



```python
import psutil

mem = psutil.virtual_memory()
print(f"Total: {mem.total/1024**3:.2f} GB")
print(f"Used: {mem.used/1024**3:.2f} GB")
print(f"Available: {mem.available/1024**3:.2f} GB")
print(f"Percent Used: {mem.percent}%")
```

---

## 📈 Disk Usage & I/O

```python
import psutil

# Check space on a specific mount point
disk = psutil.disk_usage("/")
print(f"Disk usage: {disk.percent}%")

# Monitor Read/Write throughput
io = psutil.disk_io_counters()
print(f"Read: {io.read_bytes/1024**2:.2f} MB | Write: {io.write_bytes/1024**2:.2f} MB")
```

---

## 🌐 Network Monitoring

Track bandwidth usage and verify which services are listening on specific ports.

```python
import psutil

# Cumulative network traffic
net = psutil.net_io_counters()
print(f"Sent: {net.bytes_sent/1024**2:.2f} MB | Received: {net.bytes_recv/1024**2:.2f} MB")

# List active internet connections
connections = psutil.net_connections(kind="inet")
for conn in connections[:5]:
    print(f"Local: {conn.laddr} | Status: {conn.status}")
```

---

## 🔗 Process Management

Automate the auditing of running services or terminate rogue processes that are consuming too many resources.



```python
import psutil

# Iterate over all running processes
for proc in psutil.process_iter(["pid", "name", "username"]):
    if "python" in proc.info["name"]:
        print(proc.info)

# Manage a specific process
pid = 1234
try:
    p = psutil.Process(pid)
    print(f"Killing {p.name()}...")
    p.terminate() # Send SIGTERM
except psutil.NoSuchProcess:
    print("Process already finished.")
```

---

## 🧠 Critical Nuances

* **`interval=1`**: When calling `cpu_percent()`, always provide an interval. Calling it with an interval of `0` or `None` will return `0.0` or a meaningless value because it needs two points in time to calculate a delta.
* **Permissions**: Many functions (like `net_connections` or killing processes) require **root/admin** privileges.
* **Platform Specifics**: Some attributes (like `cpu_times().iowait`) are only available on Linux. Use `hasattr()` or `try/except` for cross-platform safety.

---

## 🛠️ Demo Snippets

### Simple Health Check Alert
```python
def check_thresholds():
    if psutil.cpu_percent(interval=1) > 80:
        print("⚠️ ALERT: High CPU usage!")
    
    if psutil.virtual_memory().percent > 90:
        print("⚠️ ALERT: Memory critical!")
        
    if psutil.disk_usage("/").percent > 95:
        print("⚠️ ALERT: Disk full!")

check_thresholds()
```

### High-CPU Process Audit
```python
# Finds processes using more than 50% CPU
for proc in psutil.process_iter(['pid', 'name', 'cpu_percent']):
    try:
        # Note: .cpu_percent() here also needs a tiny delay or 
        # previous call to be accurate
        usage = proc.cpu_percent(interval=0.1)
        if usage > 50:
            print(f"PID {proc.info['pid']} ({proc.info['name']}) is using {usage}% CPU")
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        continue
```

---

## 🎯 Quick Mnemonics
* **`cpu_percent()`** → Current CPU load.
* **`virtual_memory()`** → RAM availability.
* **`disk_usage()`** → Storage capacity.
* **`process_iter()`** → System-wide `ps` command.
* **`getloadavg()`** → Standard Unix load averages (1, 5, 15 min).

