# 🔁 Python `while` Loops — Quick Reference

> *"Repetition with conditions is the engine of automation."*

---

## 🔑 Basic Syntax

```python
while condition:
    # commands executed as long as condition is True
else:
    # optional: runs only if loop ends without a 'break'
```
- **Mechanism:** The loop repeats as long as the condition evaluates to `True`.
- **Indentation:** Defines the loop body. No closing keywords like `done` or `end` are required.
- **`else` Clause:** A unique Python feature; it executes only if the loop terminates naturally (i.e., the condition becomes False) rather than via a `break` statement.



---

## 🧮 Iterating with Counters

While `for` loops are preferred for sequences, `while` is used when the number of iterations depends on a changing state.
```python
x = 0
while x < 5:
    print(f"Count: {x}")
    x += 1  # Increment is manual in while loops
```
**Output:**
```text
Count: 0
Count: 1
Count: 2
Count: 3
Count: 4
```

---

## 📂 Common DevOps Use Cases

### 1. Polling and Health Checks
Used to wait for a service, container, or API to become available.
```python
import time

while not check_service_health():
    print("Service not ready. Retrying in 5s...")
    time.sleep(5)
print("Service is UP!")
```

### 2. Infinite Monitoring Daemons
Common for scripts that need to run indefinitely (e.g., log listeners or queue workers).
```python
while True:
    task = get_next_job()
    if task == "STOP":
        break
    process_task(task)
```

---

## 🔗 Loop Control

| Statement | Action |
| :--- | :--- |
| **`break`** | Exit the loop immediately. |
| **`continue`** | Skip the rest of the current block and re-evaluate the condition. |
| **`else`** | Logic to run *only* if the loop was not interrupted by a `break`. |

**Example of Control Flow:**
```python
x = 0
while x < 5:
    x += 1
    if x == 3:
        continue  # Skip printing '3'
    print(x)
```

---

## 🧠 Critical Nuances

- **Truthiness:** Any expression can be a condition. `0`, `None`, and empty collections (`[]`, `""`) are evaluated as `False`.
- **Infinite Loop Risk:** Always ensure the loop has a path to termination (an increment, a state change, or a `break`).
- **Resource Safety:** Never use a "tight" `while True` loop without a `time.sleep()`. Doing so will spike CPU usage to 100%.
- **Indentation:** Inconsistent spacing within the loop will trigger an `IndentationError`.

---

## 🛠️ Demo Snippets

### Retry Logic with `else`
This pattern is perfect for trying an operation a limited number of times before failing.
```python
import random

attempts = 0
while attempts < 3:
    if random.choice([True, False]): # Simulate success/fail
        print("Deployment Successful!")
        break
    attempts += 1
    print(f"Attempt {attempts} failed...")
else:
    print("CRITICAL: Failed after 3 attempts.")
    # trigger_alert()
```

### Reading Streams or Files
```python
# Reading a file line-by-line until EOF
with open("access.log") as f:
    line = f.readline()
    while line:
        if "404" in line:
            print(f"Error found: {line.strip()}")
        line = f.readline()
```

### Interactive CLI Menus
```python
while True:
    cmd = input("Enter command (deploy|status|quit): ").lower()
    if cmd == "quit":
        break
    elif cmd == "deploy":
        print("Deploying...")
    else:
        print(f"Status: OK. (Unknown cmd: {cmd})")
```
