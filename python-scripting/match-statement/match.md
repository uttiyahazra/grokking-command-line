# 🗂️ Python `match` (Case) Statements — Quick Reference

> *"Pattern matching brings structural clarity to complex branching, replacing long chains of if-elif statements."*

---

## 🔑 Basic Syntax

```python
match subject:
    case pattern1:
        # commands
    case pattern2:
        # commands
    case _:
        # default / fallback (wildcard)
```
- **`match`:** Evaluates the subject variable.
- **`case`:** Compares the subject against a specific pattern or value.
- **`_` (Wildcard):** Acts as the "default" case. It catches anything that wasn't matched by previous cases.
- **Version Note:** Structural Pattern Matching requires **Python 3.10** or newer.



---

## 🧮 Simple Value Matching

Perfect for handling status codes, state machine transitions, or fixed configuration strings.
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

## 📂 Matching Multiple Values

Use the pipe operator (`|`) as a logical **OR** to group multiple patterns into a single branch.
```python
env = "prod"

match env:
    case "dev" | "test" | "staging":
        print("Non-production environment logic...")
    case "prod":
        print("Production environment logic...")
    case _:
        print("Warning: Unknown environment")
```

---

## 🔗 Matching with Conditions (Guards)

You can add an `if` statement to a `case` to create a "guard." The case only matches if the pattern matches **and** the guard is true.
```python
load = 85

match load:
    case n if n > 90:
        print("Critical: Server Overloaded")
    case n if n > 70:
        print("Warning: High Load")
    case _:
        print("Load is Normal")
```

---

## 🧩 Matching Data Structures (Destructuring)

This is the most powerful feature of `match`. It can "unpack" tuples, lists, and dictionaries directly.
```python
# Processing a coordinate tuple
point = (0, 20)

match point:
    case (0, 0):
        print("Origin")
    case (x, 0):
        print(f"X-axis at {x}")
    case (0, y):
        print(f"Y-axis at {y}")
    case (x, y):
        print(f"Point at ({x}, {y})")
```

---

## 🧠 Critical Nuances

- **Order of Execution:** Python evaluates cases from top to bottom. It executes the **first** match it finds and skips the rest.
- **Wildcard Position:** The `case _:` must always be the final case. Any cases placed after it will be unreachable.
- **No Fall-through:** Unlike C or Java, Python does not "fall through" to the next case. You don't need a `break` statement.
- **Variable Binding:** If you use a variable name in a case (like `case (x, y):`), Python assigns the value of the subject to those variables for use within that block.

---

## 🛠️ Demo Snippets

### HTTP Response Handling
```python
http_code = 404

match http_code:
    case 200 | 201 | 204:
        print("Success")
    case 400 | 401 | 404:
        print("Client Error")
    case 500 | 502 | 503:
        print("Server Error")
    case _:
        print("Unexpected Response Code")
```

### Complex Dictionary (API Response) Matching
```python
api_response = {"type": "db", "status": "down", "error": "connection_timeout"}

match api_response:
    case {"type": "web", "status": "running"}:
        print("Web server is healthy")
    case {"type": "db", "status": "down", "error": err}:
        print(f"Database failure: {err}")
    case _:
        print("Unknown system state")
```

### User Role Guard Logic
```python
user = {"role": "admin", "is_active": True}

match user:
    case {"role": "admin", "is_active": True}:
        print("Access Granted: Admin Console")
    case {"role": "admin", "is_active": False}:
        print("Access Denied: Account Disabled")
    case {"role": "guest"}:
        print("Access Granted: Read-only")
    case _:
        print("Access Denied: Unknown Role")
```
