# 🔄 Bash `for` Loops — Quick Reference

> *"Iteration is the heartbeat of automation."*

---

## 🔑 Basic Syntax

```bash
for VAR in LIST; do
    COMMANDS
done
```
- `VAR` → iterator variable (receives each item from LIST).
- `LIST` → iterable (space‑separated values, filenames, command substitution, etc.).
- `do … done` → loop body, must be closed with done.

## 🧮 Iterating Over Lists

```bash
for item in apple banana cherry; do
    echo "Fruit: $item"
done

Output:

Fruit: apple
Fruit: banana
Fruit: cherry
```

## 📂 Iterating Over Files

```bash
for file in *.txt; do
    echo "File: $file"
done
```
- Expands `*.txt` into all matching filenames.

- Each filename is assigned to `file` in turn.

## 🔗 Iterating Over Command Output

```bash
for user in $(cut -d: -f1 /etc/passwd); do
    echo "User: $user"
done
```
- Command substitution `($( … ))` generates the list.

- Each word becomes an item in the loop.

## 🧠 Critical Nuances

- ** Iterator variable vs. iterable**

In the for loop, when the loop/iterator variable (not a variable - file) will be iterated over iterable (variable - $older_file). but within the variable, when some task needs to be done, it will be used as variable within the command.

- ** Quoting matters **

Always quote variables inside commands to avoid word splitting or globbing.

```bash
for file in *.log; do
    echo "Processing $file"
    gzip "$file"
done
```

- ** Empty matches **
If *.txt matches nothing, Bash may return the literal *.txt unless nullglob is enabled.

- ** IFS (Internal Field Separator) **
Controls how words are split when iterating over command output. Default is whitespace.

## 🎯 Mnemonics
`done` = closes the loop (like fi for if).

`VAR in LIST` = “take each item in LIST and assign it to VAR.”

`"$VAR"` = safe expansion inside commands.

## 🛠️ Demo Snippets

#### Iterate over numbers
```bash
for i in 1 2 3 4 5; do
    echo "Number: $i"
done
```
#### Iterate over files
```bash
for f in /var/log/*.log; do
    echo "Compressing $f"
    gzip "$f"
done
```

#### Iterate over command output
```bash
for pkg in $(dpkg --get-selections | awk '{print $1}'); do
    echo "Installed package: $pkg"
done
```
#### Nested loop
```bash
for x in A B; do
    for y in 1 2; do
        echo "$x$y"
    done
done
```
#### Iterating over array

- Bash supports indexed arrays, which can be looped over using the `${array[@]}` expansion.

```bash
# Define an array
servers=("web01" "web02" "db01")

# Iterate over array elements
for srv in "${servers[@]}"; do
    echo "Connecting to $srv..."
done
```

👉 Use `"${array[@]}"` to preserve spaces in elements (safe Variable expansion)
👉 `${!array[@]}` gives the list of indices if you need to loop over positions instead of values.