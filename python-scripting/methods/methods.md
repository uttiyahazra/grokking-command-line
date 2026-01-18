# 🧩 Python Methods — Quick Reference

> *"Methods are functions bound to objects; they define how data behaves and interacts within the object-oriented paradigm."*

---

## 🔑 Basic Syntax

```python
object.method(arguments)
```
- **Object:** An instance of a class or a built-in type (like a String or List).
- **Method:** A function defined inside a class that performs an action on that object.
- **`self`:** In class definitions, methods always receive the object instance as the first parameter, conventionally named `self`.

---

## 📦 Types of Methods



### 1. Instance Methods
The most common type. They operate on a specific instance of a class and can access attributes via `self`.
```python
class Server:
    def start(self):
        print("Server instance started")

srv = Server()
srv.start()
```

### 2. Class Methods
Operate on the class itself rather than a specific instance. They are often used as "factory methods."
- **Decorator:** `@classmethod`
- **Parameter:** Receives `cls` instead of `self`.
```python
class Config:
    version = "1.0"
    @classmethod
    def show_version(cls):
        print(f"Global Config Version: {cls.version}")

Config.show_version()
```

### 3. Static Methods
Methods that do not access or modify the class or instance state. They behave like plain functions but belong to the class namespace.
- **Decorator:** `@staticmethod`
```python
class Utils:
    @staticmethod
    def ping(host):
        print(f"Pinging {host}...")

Utils.ping("localhost")
```

---

## 📂 Common Built-in Methods

| Type | Example Methods |
| :--- | :--- |
| **String** | `.lower()`, `.upper()`, `.strip()`, `.startswith("prefix")`, `.split(",")` |
| **List** | `.append(x)`, `.remove(x)`, `.pop()`, `.sort()`, `.extend(list)` |
| **Dict** | `.keys()`, `.values()`, `.get(key, default)`, `.update(other_dict)` |
| **Set** | `.add(x)`, `.remove(x)`, `.intersection(other_set)`, `.union(other_set)` |

---

## 🔗 Special Methods (Dunder Methods)
Double-underscore ("Dunder") methods allow you to implement operator overloading and define how objects behave with Python's built-in functions.



```python
class User:
    def __init__(self, name):
        self.name = name  # Constructor

    def __str__(self):
        return f"User: {self.name}"  # String representation

u = User("Alice")
print(u)  # Outputs: User: Alice
```

---

## 🧠 Critical Nuances

- **Bound Methods:** When you call `obj.method()`, Python automatically passes `obj` as the first argument (`self`). This is a "bound" method.
- **Self vs. Cls:** Use `self` to refer to the specific object; use `cls` to refer to the blueprint (class) itself.
- **Encapsulation:** Methods define the *behavior* of your automation tools, while attributes (variables) define their *state*.
- **Static Usage:** Use `@staticmethod` when the logic is related to the class but doesn't need to know anything about the object's data.

---

## 🛠️ Demo Snippets

### Lifecycle Instance Method
```python
class Service:
    def restart(self):
        print("Stopping service...")
        print("Service restarted successfully.")

svc = Service()
svc.restart()
```

### Tracking State with Class Methods
```python
class Deployment:
    count = 0
    @classmethod
    def increment(cls):
        cls.count += 1

Deployment.increment()
print(f"Total Deployments: {Deployment.count}")
```

### Custom Behavior with Dunder Methods
```python
class ResourcePool:
    def __init__(self, items):
        self.items = items

    def __len__(self):
        return len(self.items)

    def __getitem__(self, index):
        return self.items[index]

pool = ResourcePool(["cpu", "ram", "disk"])
print(len(pool))    # Outputs: 3
print(pool[1])      # Outputs: ram
```
