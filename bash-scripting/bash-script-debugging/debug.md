# 🐚 Bash Script Debugging — Techniques & Tools

> *"Debugging is not just fixing errors; it’s understanding how your script behaves."*

---

## 🔎 Why Debugging Matters

- Bash scripts often fail silently or behave unexpectedly due to quoting, variable expansion, or environment issues.  
- Debugging ensures scripts are **robust, portable, and maintainable**.  
- Common pitfalls: unquoted variables, wrong command substitution, incorrect paths, and subtle logic errors.

---

## ⚙️ Built-in Debugging Techniques

### 1. `set -x` / `set +x`
Enable tracing for specific blocks:
```bash
set -x   # turn on tracing
echo "Debugging this block"
ls /tmp
set +x   # turn off tracing
```
- Shows each command and its expanded arguments.

- Use selectively to avoid noisy output.

#### Run the entire script with tracing enabled
```bash
bash -x script.sh
```
- Useful for quick inspection.

#### Combine with PS4 to customize debug prefix

```bash
PS4='+ Line $LINENO: ' bash -x script.sh
```

#### Exit immediately on error

```bash
set -e
cp /nonexistent/file /tmp/   # script exits here
```
- Prevents continuing after failures.

- Combine with trap for error messages.

#### Catch errors and signals

```bash
trap 'echo "Error at line $LINENO"' ERR
```
- Prints custom message when a command fails.

- Useful for logging and debugging complex scripts.

#### 🛠️ External Tool — ShellCheck
**What is ShellCheck?**

- A static analysis tool for shell scripts.

- Detects common errors, bad practices, and portability issues.

- Provides clear suggestions for fixes.

##### Installation
```bash
# On Debian/Ubuntu
sudo apt install shellcheck

# On macOS (Homebrew)
brew install shellcheck
```

##### Usages
```bash
shellcheck script.sh
```
- Outputs warnings and recommendations.
- Example:
  ```bash
  In script.sh line 5:
  echo $file
     ^-- SC2086: Double quote to prevent globbing and word splitting.
  ```

##### Benefits
- Catches subtle bugs before runtime.

- Enforces best practices (quoting, expansions, redirections).

- Improves script portability across environments.

## 🎯 Good Debugging Practices
- **Isolate blocks**: Test small sections separately.

- **Echo variables**: Print values to confirm correctness.

- **Use logging**: Redirect output to log files for later review.

- **Iterative testing**: Run scripts incrementally during development.

- **Automated linting**: Integrate ShellCheck into CI/CD pipelines.

## 🛠️ Demo Snippets

#### Debugging a loop
```bash
set -x
for f in *.log; do
    echo "Processing $f"
done
set +x
```

#### Trap with Error Message
```bash
#!/bin/bash
set -e
trap 'echo "Error at line $LINENO"' ERR

cp /nonexistent/file /tmp/
```

#### Shellcheck Example
```bash
#!/bin/bash
file=report.txt
echo $file   # ShellCheck warns: quote this variable

Run: 
shellcheck script.sh

Output:
SC2086: Double quote to prevent globbing and word splitting.
```

