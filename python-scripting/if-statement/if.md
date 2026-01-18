# 🧩 Python `if` Statements — Quick Reference

> *"Control flow in Python is explicit, indentation-driven, and designed for readability."*

---

## 🔑 Basic Syntax

```python
if condition:
    # commands executed if condition is True
elif other_condition:
    # shorthand for "else if"
else:
    # commands executed if all above are False
```
- **Structure:** Blocks are defined by indentation; no closing keywords (like `fi` or `end`) are used.
- **Indentation:** Mandatory and must be consistent (PEP 8 recommends 4 spaces).
- **Colons:** `:` must follow every `if`, `elif`, and `else` statement.



---

## 🧮 Numeric vs String Tests

### Numbers
Use standard comparison operators: `==`, `!=`, `<`, `<=`, `>`, `>=`.
```python
x = 5
if x == 5:
    print("Equal")
```

### Strings
Use `==`, `!=`, or membership operators (`in`, `not in`).
```python
str_val = "hello"
if str_val == "hello":
    print("Match")

if "dev" in "devops":
    print("Substring found")
```

> **⚠️ Critical Nuances:**
> - Python does **not** use shell-style operators like `-eq` or `-z`.
> - String comparisons are **case-sensitive** by default. Use `.lower()` to normalize before testing.

---

## 📂 File Tests
In DevOps, checking the filesystem is a primary task. Use the `os.path` module or the modern `pathlib` library.

```python
import os

if os.path.exists("/etc"):
    print("Path exists")

if os.path.isfile("/etc/passwd"):
    print("It is a regular file")

if os.path.isdir("/var/log"):
    print("It is a directory")

if os.access("/etc/passwd", os.R_OK):
    print("File is readable")
```

---

## 🔗 Compound Conditions

Combine multiple checks using the logic keywords `and` and `or`.

```python
x = 3
if x == 1 or x == 3:
    print("x is 1 or 3")

if x > 0 and x < 10:
    print("x is between 1 and 9")
```

**Clarity Tip:** Group complex conditions with parentheses to ensure the correct order of evaluation:
```python
if (x > 0 and x < 10) or (role == "admin"):
    print("Access allowed")
```

---

## 🧠 Nuances to Remember

### 1. Boolean Truthiness
Python evaluates the "truthiness" of objects. The following are considered **False**:
- Empty sequences: `""`, `[]`, `{}`, `set()`, `range(0)`
- Numerical zero: `0`, `0.0`
- The constant `None`

### 2. Identity (`is`) vs Equality (`==`)
- `==` checks for **value** equality.
- `is` checks for **identity** (exact same object in memory). Always use `==` for comparing values like strings and numbers.

### 3. Structural Pattern Matching (Python 3.10+)
For multiple discrete matches, `match` (similar to `switch/case`) is cleaner than long `elif` chains.
```python
status = "running"
match status:
    case "running":
        print("Service is active")
    case "stopped":
        print("Service is down")
    case _:
        print("Unknown state")
```

---

## 🛠️ Demo Snippets

### Chained Comparison
Python allows human-readable range checking:
```python
age = 25
if 18 <= age < 65:
    print("Working age")
```

### Normalizing String Input
```python
env = "PROD"
if env.lower() == "prod":
    print("Deployment triggered for Production")
```

### Leap Year Logic (Nested If)
```python
year = 2026
if year % 4 == 0:
    if year % 100 == 0:
        if year % 400 == 0:
            print("Leap Year")
        else:
            print("Not a Leap Year")
    else:
        print("Leap Year")
else:
    print("Not a Leap Year")
```
