# 📘 Python Data Types — Comprehensive Reference

> *"Data types are the DNA of Python; mastering them ensures robust automation and clean abstractions."*

---

## 🔑 Core Built-in Types

### Integers (`int`)
- Whole numbers, positive or negative.
- Arbitrary precision (Python automatically handles very large numbers without overflow).
```python
x = 42
y = -7
```

### Floating Point (`float`)
- Real numbers with decimal points.
- Implemented using IEEE 754 double precision.
```python
pi = 3.14159
temp = -273.15
```

### Complex Numbers (`complex`)
- Represented as `a + bj`. Useful for specialized engineering or scientific calculations.
```python
z = 2 + 3j
```

### Strings (`str`)
- Immutable sequences of Unicode characters.
```python
name = "Uttiya"
path = "/usr/local/bin"
```

---

## 📦 Collections



### List
- Ordered, **mutable** sequence.
- Supports indexing, slicing, and dynamic resizing.
```python
servers = ["web01", "web02", "db01"]
servers.append("cache01")
```

### Tuple
- Ordered, **immutable** sequence.
- Used for fixed data groupings that should not change during script execution.
```python
coords = (10, 20)
```

### Set
- Unordered collection of **unique** elements.
- Highly efficient for membership testing and mathematical set operations (union, intersection).
```python
regions = {"us-east", "us-west", "eu-central"}
```

### Dictionary (`dict`)
- Unordered (ordered by insertion since Python 3.7+) **key-value pairs**.
- Keys must be hashable (immutable types like strings or ints).
```python
config = {"env": "prod", "replicas": 3}
print(config["env"])
```

---

## ⚙️ Boolean & Special Types

### Boolean Type
- `True` or `False`.
- Derived from integers: `True` behaves like `1`, `False` behaves like `0`.
```python
is_ready = True
if is_ready:
    deploy()
```

### NoneType
- Represents the absence of a value or a null pointer.
```python
result = None
```

---

## 🔄 Type Conversion

- **Explicit Casting:**
```python
x = int("42")       # string → int
y = float("3.14")   # string → float
z = str(100)        # int → string
```

- **Implicit Conversion (Type Promotion):**
```python
print(3 + 2.5)  # int + float → float (5.5)
```

---

## 🧠 Critical Nuances

### Mutable vs Immutable
This is the most important distinction for memory management and debugging:
* **Mutable:** `list`, `dict`, `set`. (Changes affect the original object).
* **Immutable:** `str`, `tuple`, `int`, `float`, `bool`. (Any "change" creates a new object).



### Identity (`is`) vs Equality (`==`)
* `==` checks if the **values** are the same.
* `is` checks if they are the **exact same object** in memory.
```python
a = [1, 2]
b = [1, 2]
print(a == b)  # True (same values)
print(a is b)  # False (different locations in memory)
```

### Hashability
Only **immutable** types are hashable. This is why you can use a `tuple` or `str` as a dictionary key, but you cannot use a `list`.

---

## 🛠️ Demo Snippets

### String & List Operations
```python
msg = "DevOps"
print(msg.upper())   # DEVOPS
print(msg[0:3])      # Dev (Slicing)

pods = ["api", "worker"]
pods.append("db")
print(pods)          # ['api', 'worker', 'db']
```

### Dict & Set Logic
```python
# Dictionary fallback
settings = {"debug": False}
print(settings.get("timeout", 30))  # Returns 30 if key is missing

# Set Math
a = {"dev", "prod"}
b = {"prod", "test"}
print(a & b)  # Intersection → {'prod'}
print(a | b)  # Union → {'dev', 'prod', 'test'}
```

### Type Checking
```python
x = 42
print(type(x))             # <class 'int'>
print(isinstance(x, int))  # True
```
