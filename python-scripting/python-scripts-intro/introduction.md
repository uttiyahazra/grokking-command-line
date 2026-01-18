# 🐍 Python Script Intro — Environment, Initialization & Best Practices

> *"Automation thrives on clarity, portability, and disciplined syntax."*

---

## 🌍 Python Environment

- **Interpreter vs REPL**
  - Python scripts are executed by the **Python interpreter** (`python3`).
  - The interactive REPL (`>>>`) or tools like `ipython` allow quick testing and prototyping.



- **Environment Variables**
  - Python inherits environment variables from the OS.
  - Access via `os.environ`:
    ```python
    import os
    print(os.environ["PATH"])
    ```
  - Common variables: `PATH`, `PYTHONPATH`, `HOME`.

- **Virtual Environments**
  - Isolate dependencies with `venv`:
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```
  - Keeps project libraries separate from the system Python to avoid dependency conflicts.



- **Reserved Python Attributes**
  - `__name__` → Script entry point check.
  - `__file__` → Path of the current script.
  - `__version__` → Version identifiers in modules.
  - `sys.argv` → Command-line arguments list.

---

## ⚙️ Script Initialization

- **Shebang Line**
  ```python
  #!/usr/bin/env python3
  ```
  - Must be the first line in an executable script.
  - Ensures portability by finding the Python interpreter in the user's `$PATH`.

- **Imports**
  - Standard library first, third-party next, local modules last:
    ```python
    import sys
    import requests
    from mymodule import helper
    ```

- **Entry Point Convention**
  - Ensures code runs only when executed directly, not when imported as a module by another script.
    ```python
    def main():
        # Core logic here
        pass

    if __name__ == "__main__":
        main()
    ```

- **Configuration Files**
  - Use `.env` or YAML/JSON for environment-specific settings.
  - Load with libraries like `python-dotenv` or `PyYAML`.

---

## 📑 General Syntax of a Python Script

- **Comments**
  - Single-line with `#`.
  - Docstrings (`"""..."""`) for documentation of modules, classes, and functions.

- **Variables**
  - Dynamic typing; follows `snake_case` naming convention.
    ```python
    name = "DevOps_User"
    count = 42
    ```

- **Control Structures**
  ```python
  if x > 10:
      print("Large")
  elif x == 10:
      print("Equal")
  else:
      print("Small")
  ```

- **Loops**
  - **For Loop:** Iterates over a sequence (list, range, etc.).
    ```python
    for i in range(5):
        print(i)
    ```
  - **While Loop:** Runs as long as a condition is true.
    ```python
    while condition:
        do_something()
    ```

- **Functions**
  - Defined with `def`, often including type hints for clarity.
    ```python
    def greet(name: str) -> str:
        return f"Hello, {name}"
    ```

- **Exceptions**
  - Use `try...except` for robust error handling.
    ```python
    try:
        risky_operation()
    except ValueError as e:
        print("Error:", e)
    finally:
        cleanup()
    ```

- **Command-Line Arguments**
  - Use `argparse` for professional CLI tools.
    ```python
    import argparse

    parser = argparse.ArgumentParser(description="DevOps utility script")
    parser.add_argument("--env", required=True, help="Environment name")
    args = parser.parse_args()
    ```

---

## 🧠 Good Script Practices

- **Readability**
  - Follow the **PEP 8** style guide.
  - Use **4 spaces** for indentation (no tabs).
  - Keep functions small, modular, and focused on a single task.

- **Portability**
  - Use `#!/usr/bin/env python3`.
  - Avoid hardcoding paths; use `os.path` or the `pathlib` module for cross-platform compatibility.

- **Error Handling**
  - Catch **specific exceptions**, not `Exception` blindly.
  - Use **logging** instead of `print()` for production diagnostics:
    ```python
    import logging
    logging.basicConfig(level=logging.INFO)
    logging.info("Script started")
    ```

- **Naming Conventions**
  - `snake_case` for variables and functions.
  - `CamelCase` for classes.
  - `UPPER_CASE` for constants.

- **Executable Permissions**
  - Apply executable permissions to run scripts directly:
    ```bash
    chmod +x script.py
    ./script.py
    ```

- **Dependency Management**
  - Use `requirements.txt` or `pyproject.toml` for reproducibility.
  - Pin versions for stability: `requests==2.31.0`.

- **Logging & Monitoring**
  - Redirect output to logs for auditing: `./script.py > script.log 2>&1`.
  - Integrate with monitoring tools (e.g., Prometheus, ELK stack).

- **Testing**
  - Use `pytest` for unit testing logic.
  - Automate validation in CI/CD pipelines before deployment.
