# 🔀 Bash I/O Streams & Redirections — Quick Reference
> "Control the flow of data: redirect input, output, and errors to automate cleanly."

## 🔑 Basic Concepts
- Standard Input (stdin) → `File descriptor 0` (keyboard, pipe, or file input).

- Standard Output (stdout) → `File descriptor 1` (normal program output).

- Standard Error (stderr) → `File descriptor 2` (error messages).

## 🧮 Redirecting Output

```bash
# Redirect stdout to a file (overwrite)
ls -l > files.txt

# Redirect stdout to a file (append)
ls -l >> files.txt
```
- `>` → overwrite file.

- `>>` → append to file.

## 📂 Redirecting Input
```bash
# Use a file as input
sort < unsorted.txt
```
- `<` → feed file contents into a command.

## 🔗 Redirecting Error Streams
```bash
# Redirect stderr to a file
ls /nonexistent 2> errors.log

# Redirect both stdout and stderr to one file
ls /etc /nonexistent &> output.log
```
- `2>` → redirect errors.

- `&>` → redirect both stdout and stderr.

## 🧠 Critical Nuances

**File descriptors**

0 = stdin

1 = stdout

2 = stderr

**Order matters**
```bash
# Wrong: stderr goes to file, stdout to terminal
command 2>&1 > out.log

# Correct: stdout redirected first, then stderr follows
command > out.log 2>&1
```

**Null Device**
- Redirect unwanted output to `/dev/null`.

```bash
command > /dev/null 2>&1
```

## 🎯 Mnemonics
- `>` → "Send output to file."

- `<` → "Take input from file."

- `2>` → "Errors go here."

- `/dev/null` → "Black hole for data."

## 🛠️ Demo Snippets

#### Log Errors separately

```bash
kubectl get pods 1>pods.log 2>pods.err
```

```bash
find /etc -type f 1>~/success.log 2>~/error.log
```

#### Redirecting stderr prevents error messages from cluttering the terminal:

```bash
find /etc -type f 2>~/error.log
```

#### Check exit code of last command

```bash
echo $?
```

#### Redirect both streams together

```bash
find /etc -type f &>~/success_and_error.log
```
👉 The `&` operand ensures stdout and stderr are redirected simultaneously.

```bash
find /etc -type f > success_and_error.log 2>&1
```

👉 Above two commands  produce the same result in modern Bash.

👉 `&>` is more concise, but not POSIX‑standard (works in Bash and Zsh, not in /bin/sh).

👉 > file 2>&1 is portable across shells, so it’s often preferred in scripts that need wider compatibility.

#### Stdin example with `read`
```bash
#!/bin/bash
echo "Enter your name: "
read name
echo "Your name is $name."
```