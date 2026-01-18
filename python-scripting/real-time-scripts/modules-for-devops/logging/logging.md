# 📝 Python `logging` Module — DevOps Handy Snippets

> *"Logging is the backbone of observability; the `logging` module makes your automation structured, traceable, and reliable."*

---

## 🔑 Basic Setup



The quickest way to start logging is using `basicConfig`. By default, Python logs to the console.

```python
import logging

# Set the threshold level (anything below this is ignored)
logging.basicConfig(level=logging.INFO)

logging.info("Deployment started")
logging.warning("Low disk space detected on /dev/sda1")
logging.error("Service failed to bind to port 80")
```

---

## 📂 Persisting Logs to Files

For production scripts, you must persist logs to a file for auditing and historical troubleshooting.

```python
import logging

logging.basicConfig(
    filename="/var/log/deploy.log",
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s"
)

logging.info("Deployment initiated by user: admin")
```

---

## 🔗 Multiple Handlers (Console + File)

DevOps engineers often need to see high-level info on the screen while recording deep debug details in a background file.



```python
import logging

logger = logging.getLogger("deploy_manager")
logger.setLevel(logging.DEBUG)

# 1. Console Handler (High-level info)
ch = logging.StreamHandler()
ch.setLevel(logging.INFO)

# 2. File Handler (Detailed debug trail)
fh = logging.FileHandler("/var/log/deploy_debug.log")
fh.setLevel(logging.DEBUG)

# Create format and add to handlers
formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
ch.setFormatter(formatter)
fh.setFormatter(formatter)

logger.addHandler(ch)
logger.addHandler(fh)

logger.info("Starting deployment...") # Shows in both
logger.debug("Parsing complex YAML manifest...") # Only in file
```

---

## 🧹 Exception & Context Logging

### 1. Automatic Stack Traces
Use `logging.exception()` inside an `except` block to automatically capture the full traceback.
```python
try:
    result = 1 / 0
except Exception:
    logging.exception("CRITICAL: Calculation failure") 
```

### 2. Structured Context
Injecting service names or status variables into logs makes them searchable in tools like ELK or Datadog.
```python
logger = logging.getLogger("health-check")
service = "nginx"
status = "running"
logger.info("Status Check: Service %s is %s", service, status)
```

---

## 📈 Advanced DevOps Handlers

### Rotating Logs (Prevent Disk Fill)
Prevents logs from consuming all available disk space by rotating them after a certain size.
```python
from logging.handlers import RotatingFileHandler

# Keeps 3 backup files, each max 5MB
handler = RotatingFileHandler("/var/log/app.log", maxBytes=5*1024*1024, backupCount=3)
logger.addHandler(handler)
```

### Syslog Integration
Forwards logs to the standard Linux system log (`/dev/log`), useful for centralized log management.
```python
import logging.handlers

handler = logging.handlers.SysLogHandler(address="/dev/log")
logger.addHandler(handler)
logger.info("Deployment event synchronized to syslog")
```

---

## 🧠 Critical Nuances

- **Standard Levels:** - `DEBUG`: Detailed info for diagnosing problems.
    - `INFO`: Confirmation that things are working as expected.
    - `WARNING`: An indication that something unexpected happened (e.g., 'disk space low').
    - `ERROR`: A more serious problem, the software hasn't been able to perform some function.
    - `CRITICAL`: A serious error, indicating that the program itself may be unable to continue running.
- **Lazy Formatting:** Use `logger.info("msg %s", var)` instead of f-strings for performance in high-volume logging.
- **Root vs Named Loggers:** Always use `logging.getLogger(__name__)` in modules to maintain a clean hierarchy.

---

## 🛠️ Demo Snippets

### Deployment Workflow
```python
def deploy():
    logger.info("Starting production rollout...")
    try:
        # execute_deploy()
        logger.info("Rollout 100% complete")
    except Exception:
        logger.exception("Rollout failed! Triggering rollback...")
```

### CI/CD Pipeline Mockup
```python
logger.info("Pipeline started")
logger.debug("Local cache hit for Docker layers")
logger.warning("Optional dependency 'lint' failed; continuing build...")
logger.error("Build step failed: compilation error")
```
