# 🔎 Bash Regex — Quick Reference
> "Regex unlocks powerful pattern matching for validation, parsing, and automation."

## 🔑 Basic Syntax
``` bash
if [[ STRING =~ REGEX ]]; then
    COMMANDS
fi
```

- `[[ … ]]` → Extended test command (supports regex).

- `STRING` → Input string to test.

- `REGEX` → Regular expression pattern.

- `=~` → Operator for regex matching.

## 📊 Common Regex Patterns
- `^` → Start of string

- `$` → End of string

- `.` → Any single character

- `[abc]` → Any one of a, b, or c

- `[^abc]` → Any character except a, b, or c

- `[0-9]` → Any digit

- `+` → One or more occurrences

- `*` → Zero or more occurrences

- `?` → Zero or one occurrence

- `{n,m}` → Between n and m occurrences

## 🧮 Simple Example

```bash
#!/bin/bash
input="hello123"

# ^[a-z]+[0-9]+$
# ^        → anchor: start of string
# [a-z]+   → one or more lowercase letters
# [0-9]+   → one or more digits
# $        → anchor: end of string
if [[ $input =~ ^[a-z]+[0-9]+$ ]]; then
    echo "Valid: letters followed by digits"
else
    echo "Invalid format"
fi
```

## 📂 Extracting Matches

```bash
#!/bin/bash
text="Version: 2.5.1"

# ([0-9]+\.[0-9]+\.[0-9]+)
# ( … )   → capture group
# [0-9]+  → one or more digits
# \.      → literal dot
# repeated three times for major.minor.patch
if [[ $text =~ ([0-9]+\.[0-9]+\.[0-9]+) ]]; then
    echo "Extracted version: ${BASH_REMATCH[1]}"
fi
```

## 🔗 Real DevOps Example (Log Validation)

```bash
#!/bin/bash
log="ERROR: Connection failed at 10.0.0.5"

# Simple substring match for "ERROR"
if [[ $log =~ ERROR ]]; then
    echo "❌ Error detected in logs"
fi

# ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)
# Matches IPv4 address format: four groups of digits separated by dots
if [[ $log =~ ([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+) ]]; then
    echo "IP Address found: ${BASH_REMATCH[1]}"
fi
```

## 🧠 Critical Nuances
- Use `[[ … ]]` not `[ … ]` for regex.

- `Don’t quote` regex patterns — quoting disables regex expansion.

- Anchors `(^, $)` ensure full string match.

- Regex ≠ globbing (*, ? in shell).

## 🎯 Mnemonics
- `=~` → "Matches regex."

- `^…$` → "Anchor to start and end."

- BASH_REMATCH → "Capture groups live here."

## 🛠️ Demo Snippets

#### Validate Email

```bash
email="user@example.com"

# ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$
# ^                         → start of string
# [A-Za-z0-9._%+-]+         → one or more valid username chars
# @                         → literal @ symbol
# [A-Za-z0-9.-]+            → one or more domain chars
# \.                        → literal dot
# [A-Za-z]{2,}              → at least two letters (TLD)
# $                         → end of string
if [[ $email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$ ]]; then
    echo "Valid email"
else
    echo "Invalid email"
fi
```

#### Validate IP Address
```bash
ip="192.168.1.10"

# ^([0-9]{1,3}\.){3}[0-9]{1,3}$
# ^                  → start of string
# ([0-9]{1,3}\.){3}  → three groups of 1–3 digits followed by a dot
# [0-9]{1,3}         → final group of 1–3 digits
# $                  → end of string
if [[ $ip =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    echo "Valid IP"
else
    echo "Invalid IP"
fi
```

#### Extract Domain from URL
```bash
url="https://example.com/page"

# https?://([^/]+)/
# https?      → "http" followed optionally by "s"
# ://         → literal ://
# ([^/]+)     → capture group: one or more non-slash chars (domain)
# /           → literal slash
if [[ $url =~ https?://([^/]+)/ ]]; then
    echo "Domain: ${BASH_REMATCH[1]}"
fi
```

#### Log Parsing in a loop
```bash
tail -f /var/log/syslog | while read line; do
    # Match substring "ERROR"
    if [[ $line =~ ERROR ]]; then
        echo "❌ Error: $line"
    # Match substring "WARN"
    elif [[ $line =~ WARN ]]; then
        echo "⚠️ Warning: $line"
    fi
done
```
