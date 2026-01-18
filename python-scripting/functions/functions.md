# 🧩 Python Functions — Quick Reference

> *"Functions are the building blocks of reusable automation. They allow you to wrap complex logic into simple, repeatable interfaces."*

---

## 🔑 Basic Syntax

```python
def function_name(parameters):
    """Optional docstring describing the function."""
    # commands
    return value
```
- **`def`**: The keyword used to define a function.
- **`function_name`**: Should be descriptive and follow `snake_case`.
- **`parameters`**: Placeholders for data passed into the function.
- **`return`**: Sends a result back to the caller. If omitted, the function returns `None`.



---

## 📦 Types of Functions

### Standard Functions
The most common form, taking specific positional arguments.
```python
def greet(name):
    return f"Hello, {name}"
```

### Default Parameters
Allows you to call functions with fewer arguments by providing fallbacks.
```python
def connect(host="localhost", port=3306):
    return f"Connecting to {host}:{port}"

print(connect())                # Uses defaults
print(connect("192.168.1.10"))  # Overrides host
```

### Variable Arguments (`*args` and `**kwargs`)
Used when you don't know how many arguments will be passed.
- `*args`: Receives a **tuple** of extra positional arguments.
- `**kwargs`: Receives a **dictionary** of extra keyword arguments.
```python
def log(*args, **kwargs):
    print("Positional:", args)
    print("Keywords:", kwargs)

log("error", code=500, msg="Server down")
```

---

## 🔗 Lambda (Anonymous Functions)
Small, one-line functions without a name. Ideal for short-lived operations inside `map()`, `filter()`, or `sorted()`.
```python
square = lambda x: x**2
print(square(5))  # 25
```

---

## 📂 Scope & Variables

Python follows the **LEGB Rule** for variable resolution:
1. **L**ocal: Inside the function.
2. **E**nclosing: In any nesting functions.
3. **G**lobal: At the top level of the script.
4. **B**uilt-in: Reserved Python keywords.



```python
x = "global"

def func():
    x = "local"
    print(x)

func()       # Outputs: local
print(x)     # Outputs: global
```

---

## 🧠 Critical Nuances

### 1. Mutable Defaults (The "Gotcha")
Never use mutable objects (like lists or dicts) as default arguments. They are initialized once at definition time, not every time the function is called.
```python
# ⚠️ Problematic:
def add_item(item, items=[]):
    items.append(item)
    return items

# ✅ Safe:
def add_item(item, items=None):
    if items is None:
        items = []
    items.append(item)
    return items
```

### 2. Type Hinting
Modern DevOps scripts use type hints to improve readability and catch bugs with static analysis tools like `mypy`.
```python
def add(x: int, y: int) -> int:
    return x + y
```

---

## 🛠️ Demo Snippets

### System Automation Wrapper
```python
def get_uptime():
    import os
    return os.popen("uptime").read().strip()

print(f"System Status: {get_uptime()}")
```

### Backup Logic with Logic Flags
```python
def backup(path: str, compress: bool = True):
    mode = "with compression" if compress else "without compression"
    print(f"Backing up {path} {mode}")

backup("/var/www/html", compress=False)
```

### Flexible Notification Tool
```python
def notify(*users, **options):
    for user in users:
        print(f"Sending alert to {user}...")
    if options.get("urgent"):
        print("ALERT LEVEL: CRITICAL")

notify("alice", "bob", urgent=True)
```

### Recursive Directory Search (Example)
```python
def factorial(n):
    if n == 0:
        return 1
    return n * factorial(n-1)

print(factorial(5))  # 120
```
