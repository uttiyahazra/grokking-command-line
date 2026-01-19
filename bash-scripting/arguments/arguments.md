# 🎯 Bash Script Arguments — Quick Reference
> "Arguments are the lifeblood of reusable scripts."

## 🔑 Basic Syntax

```bash
#!/bin/bash
echo "First argument: $1"
echo "Second argument: $2"
echo "All arguments: $@"
```
- $0 → Name of the script itself

- $1, $2, … → Positional arguments (first, second, etc.)

- $@ → All arguments as separate words

- $* → All arguments as a single word (respecting IFS)

- $# → Number of arguments passed

## 🧮 Accessing Arguments

```bash
#!/bin/bash
echo "Script name: $0"
echo "First arg: $1"
echo "Second arg: $2"
echo "Total args: $#"
```

**Run**
```bash
./myscript.sh alpha beta
```

**Output** 
```bash
Script name: ./myscript.sh
First arg: alpha
Second arg: beta
Total args: 2
```

## 📂 Iterating Over Arguments

```bash
#!/bin/bash
for arg in "$@"; do
    echo "Argument: $arg"
done
```

**Run**
```bash
./myscript.sh dev prod test
```

**Output**
```bash
Argument: dev
Argument: prod
Argument: test
```

## 🔗 Special Argument Variables

- `$@` → Preserves argument boundaries (safe for spaces)

- `$*` → Joins arguments into one string (rarely used)

- `$#` → Count of arguments

- `$?` → Exit status of last command

- `$$` → PID of current script

- `$!` → PID of last background process

## 🧠 Critical Nuances

**Quoting matters**  
- Always quote `"$@"` to preserve spaces in arguments.

```bash
for arg in "$@"; do
    echo "$arg"
done
```

**Argument Count Check**
- Validate arguments before using them.

```bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 arg1 arg2"
    exit 1
fi
```

**Shift command**
- Moves positional arguments left. Useful for parsing.

```bash
while [ $# -gt 0 ]; do
    echo "Processing: $1"
    shift
done
```
## 🎯 Mnemonics
- Think of arguments as `slots` filled when you run the script:

```bash
./script.sh alpha beta gamma
```

**Diagram**

```text
$0   → ./script.sh   (the script itself)
$1   → alpha         (first argument)
$2   → beta          (second argument)
$3   → gamma         (third argument)
$@   → alpha beta gamma   (all arguments, safely separated)
$*   → "alpha beta gamma" (all arguments, one string)
$#   → 3             (number of arguments)
```

👉 Memory Hook:

- `0` = Script

- `#` = Count

- `@` = All, safely

- `Shift` = Move left

## 🛠️ Demo Snippets
#### Check Required Arguments

```bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source> <destination>"
    exit 1
fi
```

#### Loop Through Arguments

```bash
for param in "$@"; do
    echo "Got parameter: $param"
done
```

#### Parse options with shift

```bash
while [ $# -gt 0 ]; do
    case "$1" in
        -u|--user) USER="$2"; shift 2 ;;
        -p|--port) PORT="$2"; shift 2 ;;
        *) echo "Unknown option: $1"; shift ;;
    esac
done
```

#### Forward Arguments to Another Command

```bash
#!/bin/bash
echo "Running ls with args: $@"
ls "$@"
```