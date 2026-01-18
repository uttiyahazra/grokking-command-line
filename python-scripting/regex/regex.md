# 🔎 Python Regular Expressions — Quick Reference

> *"Regex is the scalpel of text processing; precise patterns yield clean automation."*

---

## 🔑 Basic Syntax

```python
import re

pattern = r"regex_pattern"
match = re.search(pattern, text)
```
- **`r"..."` (Raw Strings):** Always use raw string literals to avoid backslash escaping issues (e.g., `r"\n"` is a literal backslash and 'n', not a newline).
- **`re.search()`:** Scans through the string for the first location where the pattern matches.
- **`re.match()`:** Checks for a match only at the **beginning** of the string.
- **`re.findall()`:** Returns a list of all non-overlapping matches in the string.
- **`re.sub()`:** Replaces occurrences of the pattern with a replacement string.



---

## 📦 Common Patterns & Quantifiers

| Meta-character | Description | Meta-character | Description |
| :--- | :--- | :--- | :--- |
| `.` | Any character (except newline) | `\d` | Any digit (0-9) |
| `^` | Start of the string | `\w` | Word character (a-z, A-Z, 0-9, _) |
| `$` | End of the string | `\s` | Whitespace (space, tab, newline) |
| `+` | 1 or more repetitions | `[abc]` | Any character in the set (a, b, or c) |
| `*` | 0 or more repetitions | `[^abc]` | Any character **not** in the set |
| `?` | Optional (0 or 1) | `|` | Logical OR |

---

## 🧮 Matching & Substitution Examples

### Finding Patterns
```python
import re

text = "Order123 and Order456"
digits = re.findall(r"\d+", text) 
# Output: ['123', '456']
```

### Replacing Text (Substitution)
In DevOps, this is vital for masking secrets or cleaning logs.
```python
log = "ERROR at line 42"
clean = re.sub(r"\d+", "X", log)
# Output: "ERROR at line X"
```

### Splitting Strings
More powerful than `.split()` because it supports multiple delimiters.
```python
data = "apple,banana;cherry orange"
items = re.split(r"[;, ]+", data)
# Output: ['apple', 'banana', 'cherry', 'orange']
```

---

## 🧠 Critical Nuances

### Greedy vs. Non-Greedy
* **Greedy (`*`, `+`):** Matches as much text as possible.
* **Non-Greedy (`*?`, `+?`):** Matches as little text as possible.
```python
text = "<tag>content</tag>"
# Greedy: re.findall(r"<.*>", text)  -> ['<tag>content</tag>']
# Non-Greedy: re.findall(r"<.*?>", text) -> ['<tag>', '</tag>']
```



### Grouping & Capturing
* `( )`: Captures a group for later retrieval.
* `(?: )`: Non-capturing group (used for grouping without saving).
* `(?P<name> )`: Named group for readable access.

### Compilation Flags
* `re.IGNORECASE` (or `re.I`): Case-insensitive matching.
* `re.MULTILINE` (or `re.M`): Makes `^` and `$` match start/end of lines (not just the whole string).
* `re.DOTALL` (or `re.S`): Makes `.` match newlines as well.

---

## 🛠️ Demo Snippets

### Validate IP Address (IPv4)
```python
pattern = r"^\d{1,3}(\.\d{1,3}){3}$"
ip = "192.168.1.1"
is_valid = bool(re.match(pattern, ip)) # True
```

### Extract Domain from Email (Using Groups)
```python
email = "admin@company.org"
match = re.search(r"@([\w\.-]+)", email)
if match:
    domain = match.group(1) # company.org
```

### Named Groups for Clean Code
```python
m = re.match(r"(?P<user>\w+)@(?P<domain>[\w\.]+)", "alice@example.com")
print(m.group("user"))   # alice
print(m.group("domain")) # example.com
```

### Multi-line Log Parsing
```python
log = "INFO ok\nERROR failed\nERROR timeout"
# Finds all lines starting with ERROR
errors = re.findall(r"^ERROR.*", log, re.MULTILINE)
# Output: ['ERROR failed', 'ERROR timeout']
```
