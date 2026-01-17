# 🧩 Bash `if` Statements — Quick Reference

> *"Control flow in Bash is simple, but the nuances matter."*

---

## 🔑 Basic Syntax

```bash
if CONDITION; then
    COMMANDS
elif OTHER_CONDITION; then
    COMMANDS
else
    COMMANDS
fi
```

- `if … fi` → always closes with fi (think: “if backwards”).

- `elif` → shorthand for “else if”.

- `then` → must follow the condition (same line or next line).

## 🧮 Numeric vs String Tests

- `Numbers` → use -eq, -ne, -lt, -le, -gt, -ge

```bash
if [[ $x -eq 5 ]]; then echo "Equal"; fi
```
- `Strings` → use =, ==, !=

```bash
if [[ $str == "hello" ]]; then echo "Match"; fi
```

⚠️ Critical nuance:

`-eq` only works with integers. Use `==` for literal string comparison.

Quoting numbers is optional, but quoting strings is mandatory.

## 📂 File Tests
- `-e file` → exists

- `-f file` → regular file

- `-d dir` → directory

- `-r file` → readable

- `-w file` → writable

- `-x file` → executable

```bash
if [[ -d /etc ]]; then echo "Directory exists"; fi
```

## 🔗 Compound Conditions
- `OR` → ||
- `AND` → &&

```bash
if [[ $x -eq 1 || $x -eq 3 ]]; then
    echo "x is 1 or 3"
fi

if [[ $x -gt 0 && $x -lt 10 ]]; then
    echo "x is between 1 and 9"
fi
```
## 🧠 Nuances to Remember

- Always put spaces after [[ and before ]].

- Always put spaces between operands and operators ($x -eq 5, not $x- eq5).

- Think of [[ … ]] as a command: arguments must be separated by whitespace.

- [ … ] → POSIX test command (limited).

- [[ … ]] → Bash extended test (preferred). Supports ||, &&, regex.

- (( … )) → arithmetic evaluation (no $ needed inside).

- fi = “if backwards” → closes the block.

```bash
current_year=$(date +%Y)
if (( $(($current_year)) % 400 == 0 )); then echo "Leap year"; fi
```
- Always quote variables in [ … ] to avoid word‑splitting:

```bash
if [ "$var" = "foo" ]; then …; fi
```
- Use `case` for multiple discrete matches (cleaner than long chains of ||).