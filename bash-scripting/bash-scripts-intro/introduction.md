# 🐚 Bash Script Intro — Environment, Initialization & Best Practices

> *"A good script begins with a clean environment and disciplined syntax."*

---

## 🌍 Bash Environment

- **Shell vs Terminal**  
  - The terminal is the interface; Bash is the shell interpreter running inside it.  
  - Scripts execute in a **subshell** environment, inheriting exported variables.

- **Environment Variables**  
  - Common ones: `PATH`, `HOME`, `USER`, `SHELL`, `PWD`.  
  - Export variables to make them available to child processes:
    ```bash
    export PATH="/usr/local/bin:$PATH"
    ```

- **Reserved Bash Variables**  
  - `BASH_VERSION` → version of Bash.  
  - `UID` → numeric user ID.  
  - `RANDOM` → random number generator.  
  - `SECONDS` → seconds since shell started.  
  - `LINENO` → current line number in script.

---

## ⚙️ Shell Initialization

- **Shebang Line**  
  ```bash
  #!/bin/bash
  ```
  - Must be the first line in a script.

  - Specifies which interpreter executes the script.
  
  - **Startup Files**
    - `/etc/profile` → system-wide initialization.
    - `~/.bash_profile`, `~/.bash_login`, `~/.profile` → user login shells.
    - `~/.bashrc` → interactive non-login shells.
    - `~/.bash_logout` → executed when login shell exits.
  
  - **Subshell Behaviour**
    - Scripts run in a subshell.

    - Exported variables are inherited; local variables are not.

    - Changes in subshell do not affect parent shell.

## 📑 General Syntax of a Bash Script
- Comments
```bash
# This is a comment
```
  - Starts with `#`
  - Document purpose, parameters, and logic.

- Commands
  - Any shell command can be placed in the script.
  - Commands execute sequentially unless control structures are used.

- Variables
  - No spaces around `=`
  - Always quote expansions: `"${VAR}"`

- Quotting
  - `"double quotes"` → expand variables and command substitution.
  - `'single quotes'` → literal text, no expansion.
  - Backticks `command` → legacy command substitution (`prefer $(command)`).

- Exit Status
  - `$?` → exit status of last command (0 = success).
  - Use `exit N` to set script exit code.

## 🧠 Good Script Practices
- Readability

  - Use indentation and spacing.

  - Comment generously.

  - Group related commands.

- Portability

  - Always use #!/bin/bash or #!/usr/bin/env bash.

  - Avoid non-standard shell features if portability is required.

- Error Handling

  - set -e → exit on error.

  - trap 'echo "Error at line $LINENO"' ERR → custom error messages.

- Quoting Discipline

  - Always quote variables: "${VAR}".

  - Prevents word splitting and globbing issues.

- Naming Conventions

  - Use uppercase for environment variables.

  - Use lowercase for local script variables.

  - Avoid starting variable names with digits or using special characters.

- Executable Permissions

```bash
chmod +x script.sh
```
Required to run script directly (./script.sh).

- Logging

  - Redirect output and errors to log files:

```bash
./script.sh > script.log 2>&1
```