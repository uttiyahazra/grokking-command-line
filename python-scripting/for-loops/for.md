# 🔄 Python `for` Loops — Quick Reference

> *"Iteration is the heartbeat of automation. In Python, loops are designed to be expressive, readable, and highly efficient for handling collections of data."*

---

## 🔑 Basic Syntax

```python
for VAR in ITERABLE:
    # commands to execute for each item
```
- **VAR:** The iterator variable that receives each item from the collection.
- **ITERABLE:** Any sequence or collection (list, tuple, dict, set, string, or generator).
- **Structure:** The loop body is defined strictly by **indentation** (usually 4 spaces). Unlike Bash, no `done` keyword is required.



---

## 🧮 Iterating Over Lists

The most common use case for loops is processing a list of items.
```python
fruits = ["apple", "banana", "cherry"]
for item in fruits:
    print(f"Fruit: {item}")
```
**Output:**
```text
Fruit: apple
Fruit: banana
Fruit: cherry
```

---

## 📂 Iterating Over Files

In DevOps, you often need to loop through a directory of configuration or log files.
```python
import glob

# glob.glob expands patterns into a list of filenames
for file in glob.glob("*.txt"):
    print(f"Found config file: {file}")
```

---

## 🔗 Iterating Over Command Output

To process system information, you can capture shell output and iterate through the lines.
```python
import subprocess

# Runs command, captures output, and splits into a list of lines
users = subprocess.check_output("cut -d: -f1 /etc/passwd", shell=True, text=True).splitlines()

for user in users:
    print(f"System User: {user}")
```

---

## 🧠 Critical Nuances

- **Variable Context:** The loop variable (`VAR`) exists only to store the current item. Changes to `VAR` inside the loop do not typically modify the original collection.
- **Quoting Discipline:** Always use f-strings (`f"{VAR}"`) to safely expand variables inside strings.
- **Empty Iterables:** If the list or collection is empty, the loop body is skipped entirely—no error is thrown.
- **Iteration Order:** - **Lists/Tuples:** Preserve order.
  - **Sets:** Unordered.
  - **Dictionaries:** Preserves insertion order (since Python 3.7+).

---

## 🎯 Mnemonics

* **`for VAR in ITERABLE:`** → *"Take each item in the collection and assign it to VAR."*
* **`f"{VAR}"`** → The safe way to expand values inside strings.
* **Indentation = Body** → Indentation is the only thing that tells Python where the loop ends.

---

## 🛠️ Demo Snippets

### Iterate over Numeric Ranges
```python
# range(start, stop) - stop is exclusive
for i in range(1, 6):
    print(f"Processing batch number: {i}")
```

### Iterate over Dictionaries
Use `.items()` to access both the key (setting name) and the value (setting value).
```python
config = {"env": "prod", "replicas": 3, "region": "us-east-1"}

for key, value in config.items():
    print(f"Configuration: {key} is set to {value}")
```

### Nested Loops
Useful for matrix-like operations or testing combinations.
```python
for env in ["Dev", "Prod"]:
    for tier in ["Web", "DB"]:
        print(f"Checking {env}-{tier} health...")
```

### Advanced Shell Pipe Integration
```python
import subprocess

# Example: Finding specific installed packages
cmd = "dpkg --get-selections | awk '{print $1}'"
pkgs = subprocess.check_output(cmd, shell=True, text=True).splitlines()

for pkg in pkgs:
    if "python" in pkg:
        print(f"Python-related package found: {pkg}")
```