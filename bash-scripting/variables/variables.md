# 📘 Bash Variables — Comprehensive Reference

> *"Variables are the backbone of Bash scripting; how you expand or export them defines your automation."*

---

## 🔑 Basic Syntax

```bash
VARNAME="value"
echo "$VARNAME"
```
- **No spaces** around `=` when assigning.

- Variables are **case-sensitive**.

- Convention: environment variables in UPPERCASE, local variables often lowercase.

## 📦 Types of Variables

#### Local Variables
- Exist only in the current shell.

- Not inherited by child processes.

- Display with set.

#### Global (Environment) Variables
- Available to all child processes.

- Display with printenv or env.

- Created with export:
```bash
export PATH="/usr/local/bin:$PATH"
```

#### Variables by Content
- String variables → default type.

- Integer variables → used in arithmetic.

- Constant variables → marked `readonly`.

- Array variables → store multiple values.

## 🔗 Variable Expansion

```bash
file="report.txt"
echo "$file"
```

- `$file` → expands to `report.txt`.

- `"${file}"` → same, but safer when values `contain spaces`.

## 🔄 Command Substitution vs Variable Expansion

### Command Substitution

```bash
today=$(date +%Y-%m-%d)
echo "Today is $today"
```
- `$( … )` → runs a command and captures its output.
- Example: `$(date)` runs date and stores the result.

### Variable Expansion

```bash
greeting="Hello"
echo "$greeting World"

```
- `$greeting` → expands the stored value. expands the variable correctly.
- `$(greeting)` → tries to run a command named greeting (error).

## 🧠 Critical Nuances

- Command substitution vs variable expansion

  - `$(command)` → run command, substitute its output.

  - `$variable` → expand variable value.

⚠️ Mixing them incorrectly ($(variable)) causes “command not found” errors.

- Quoting matters

  - Always quote variables: "${VAR}".

  - Prevents word splitting and globbing.

## 🎯 Mnemonics
- $VAR = expand variable.

- $(CMD) = run command.

- "${VAR}" = safe expansion.

- ${VAR:-default} = fallback value.

## 🛠️ Demo Snippets

#### Variable Expansion

```bash
filename="my favorite report.txt"
echo "${filename}"

Output: my favorite report.txt
```
#### Command Substitution
```bash
today=$(date +%A)
echo "It is $today"

Output: It is Sunday"
```
#### Critical Nuance Example
```bash
file="logfile.txt"

echo "$file"        # ✅ expands variable → logfile.txt
echo "$(file)"      # ❌ tries to run command "file" → error
```
#### Safe Expansion with Spaces
```bash
filename="my report.txt"
echo "$filename"    # ✅ prints "my report.txt"
echo $filename      # ⚠️ prints "my" and "report.txt" separately
```
#### Default Value
```bash
echo "${USER:-guest}"

Output: guest  #if USER is unset
```
