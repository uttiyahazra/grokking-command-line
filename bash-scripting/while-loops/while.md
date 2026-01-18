# 🔄 Bash `while` Loops — Quick Reference

> *"Persistence is the engine of automation."*

---

## 🔑 Basic Syntax

```bash
while CONDITION; do
    COMMANDS
done
```
- `CONDITION` → evaluated before each iteration; loop continues while it is true (exit status = 0).

- `do … done` → loop body, must be closed with done.

## 🧮 Looping with Conditions

```bash
count=1
while [ $count -le 3 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

Output:

Count: 1
Count: 2
Count: 3
```
- The loop runs until `count` exceeds 3.

## 📂 Reading Files Line by Line

```bash
while read line; do
    echo "Line: $line"
done < file.txt
```
- Reads `file.txt` line by line.

- Each line is assigned to `line`.

## 🔗 Looping Over Command Output

```bash
while read user; do
    echo "User: $user"
done < <(cut -d: -f1 /etc/passwd)

```
- Process substitution `< <( … )` feeds command output into the loop.
- Each word/line becomes an item.

## 🧠 Critical Nuances

**Exit Status Matters**  
- The loop continues while the condition returns exit status `0 (true)`.

**Quoting Matters**  
- Always quote variables inside commands to avoid word splitting or globbing.

**EOF Handling**  
- read returns non-zero at end-of-file, terminating the loop.

**IFS (Internal Field Separator)**
- Controls how `read` splits input. Default is whitespace.
Use `IFS= read -r line` to preserve leading/trailing spaces and backslashes.

## 🎯 Mnemonics
`done` = closes the loop (like fi for if).

`while CONDITION` = “keep looping as long as CONDITION is true.”

`read line` = safe way to consume input line by line.

## 🛠️ Demo Snippets

#### Countdown

```bash
count=5
while [ $count -gt 0 ]; do
    echo "Countdown: $count"
    count=$((count - 1))
done
```

#### Monitor a Process

```bash
while pgrep nginx > /dev/null; do
    echo "nginx is running..."
    sleep 5
done
```

#### Read File safely

```bash
while IFS= read -r line; do
    echo "Line: $line"
done < /etc/hosts
```

#### Infinite Loop

```bash
while true; do
    echo "Press Ctrl+C to stop"
    sleep 2
done
```