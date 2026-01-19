# 🚦 Bash Exit Codes — Quick Reference
> "Exit codes are the silent signals of success or failure in automation."

## 🔑 Basic Concepts
- `Exit code` → Numeric value returned by a command or script.

- Check with `$?` → Stores the exit code of the last executed command.

- Convention:

  - `0` → Success (command executed correctly).

  - `Non‑zero`→ Failure (different numbers may indicate different errors).

## 🧮 Simple Usage
```bash
ls /etc
echo $?   # Prints 0 if ls succeeded
```

```bash
ls /nonexistent
echo $?   # Prints non-zero (e.g., 2) if ls failed
```

## 📂 Custom Exit Codes in Scripts

```bash
#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1   # Exit with code 1 for missing argument
fi

if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 2   # Exit with code 2 for missing file
fi

echo "File exists: $1"
exit 0       # Exit with code 0 for success
```

## 🔗 Real DevOps Example (Database Backup)

```bash
#!/bin/bash
DB_NAME=$1
BACKUP_FILE="/backups/${DB_NAME}_$(date +%F).sql"

pg_dump "$DB_NAME" > "$BACKUP_FILE"

if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
    exit 0
else
    echo "Backup failed for database: $DB_NAME"
    exit 2
fi
```

## 🧠 Critical Nuances
**Exit codes propagate**  
- A script’s exit code is the exit code of the last command unless explicitly set with exit.

**Check immediately**  
- $? must be checked right after the command; running another command overwrites it.

**Custom codes**  
- Use non‑zero codes (1–255) to indicate specific error conditions in scripts.

**Special built‑ins**

- true → always exits with 0.

- false → always exits with 1

## 🎯 Mnemonics

- `0` → "Zero problems."

- `Non‑zero` → "Something went wrong."

- `$?` → "What happened last?"

```bash
Command → Exit Code → $? → Next Decision
```

## 🛠️ Demo Snippets

#### Check Service Status

```bash
systemctl status nginx > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "Nginx is running"
else
    echo "Nginx is not running"
fi
```

#### Retry on Failure

```bash
ping -c 1 example.com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Ping failed, retrying..."
    ping -c 1 example.com
fi
```

#### Exit Code Forwarding

```bash
#!/bin/bash
command_that_might_fail
exit $?   # Forward the same exit code to caller
```