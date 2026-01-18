# 📘 Python Variables — Comprehensive Reference

> *"Variables are the backbone of Python scripting; how you assign, scope, and manage them defines your automation."*

---

## 🔑 Basic Syntax

```python
varname = "value"
print(varname)
```
- **Spacing:** Spaces around `=` are recommended for readability (PEP 8), but only one assignment operator is allowed per statement.
- **Case Sensitivity:** `myVar` and `myvar` are distinct variables.
- **Naming Convention:** Use `snake_case` for variables/functions and `UPPERCASE` for constants.

---

## 📦 Types of Variables

### 1. Variables by Scope
- **Local Variables:** Declared inside functions; they exist only within that function's block.
- **Global Variables:** Declared outside functions; accessible across the entire module.



### 2. Variables by Content
- **Strings:** Default for text data.
- **Integers/Floats:** Used for numeric calculations and offsets.
- **Booleans:** `True` or `False` (vital for conditional logic).
- **Collections:** Lists `[]`, Tuples `()`, Sets `{}`, and Dictionaries `{"key": "value"}`.

### 3. Constants
- Python has no strictly "immutable" constant type.
- **Convention:** Use `UPPER_CASE` to signal to other developers that the value should not be changed.
  ```python
  PI = 3.14159
  DB_TIMEOUT = 30
  ```

---

## 🔗 Variable Expansion & Formatting

### Basic Expansion
```python
file = "report.txt"
print(file)  # Outputs: report.txt
```

### f-Strings (Literal String Interpolation)
The modern standard for safe and readable expansion.
```python
filename = "report.txt"
print(f"The generated report is: {filename}")
```

### Expression Evaluation
Python evaluates logic directly inside the curly braces of an f-string:
```python
x = 5
print(f"Square of {x} is {x**2}") # Output: Square of 5 is 25
```

---

## 🧠 Critical Nuances

### Mutable vs Immutable
Understanding this prevents bugs when passing variables to functions:
- **Mutable:** Lists, Dictionaries, Sets (can be changed in place).
- **Immutable:** Strings, Tuples, Integers (cannot be changed; a new object is created instead).



### Scope Resolution (LEGB Rule)
Python searches for a variable name in this specific order:
1. **L**ocal: Inside the current function.
2. **E**nclosing: In any enclosing functions (nested).
3. **G**lobal: At the top level of the script/module.
4. **B**uilt-in: Reserved Python names (like `len` or `print`).

### Default Values (Dictionary Safety)
In DevOps scripts, environment keys are often missing. Use `.get()` to avoid `KeyError`:
```python
config = {"ENV": "production"}
# Returns "default" if "USER" key doesn't exist
print(config.get("USER", "guest")) 
```

---

## 🎯 Mnemonics & Quick Reference

* `var = value` → **Assign** variable.
* `f"{VAR}"` → **Expand** variable safely.
* `CONST_NAME` → **Constant** naming convention.
* `.get("key", default)` → **Fallback** value logic.

---

## 🛠️ Demo Snippets

### Variable Expansion
```python
filename = "production_logs.txt"
print(filename) 
# Output: production_logs.txt
```

### f-String Expansion with Logic
```python
today = "Monday"
items = 3
print(f"Today is {today}. Processing {items} tasks.")
# Output: Today is Monday. Processing 3 tasks.
```

### Safe Dictionary Access
```python
settings = {"RETRIES": 5}
# Accessing an existing key
print(settings.get("RETRIES", 1)) # Output: 5
# Accessing a missing key with a fallback
print(settings.get("TIMEOUT", 30)) # Output: 30
```
