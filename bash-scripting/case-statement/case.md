# 🔀 Bash case Statement — Quick Reference
> "Pattern matching made simple: case lets you branch logic cleanly without endless if chains."

## 🔑 Basic Syntax
```bash
case EXPRESSION in
    PATTERN1)
        COMMANDS
        ;;
    PATTERN2)
        COMMANDS
        ;;
    *)
        DEFAULT_COMMANDS
        ;;
esac
```

- `EXPRESSION` → The value to test (string, variable, or command output).

- `PATTERN` → Shell glob patterns `(*, ?, [ ])` used for matching.

- `;;` → Terminates each pattern block.

- `*)` → Default case (like else in if).

- `esac` → Closes the case block (reverse of case).

## 📊 Menu‑Driven Selection
```bash
#!/bin/bash
echo "===== Deployment Menu ====="
echo "1) Start Nginx"
echo "2) Stop Nginx"
echo "3) Restart Nginx"
echo "4) Exit"

read -p "Choose an option: " choice

case "$choice" in
    1) systemctl start nginx ; echo "Nginx started" ;;
    2) systemctl stop nginx  ; echo "Nginx stopped" ;;
    3) systemctl restart nginx ; echo "Nginx restarted" ;;
    4) echo "Exiting..." ;;
    *) echo "Invalid option, please try again." ;;
esac
```

👉 Useful for interactive DevOps scripts where operators select actions from a menu.

## 📂 Multiple Patterns
```bash
file=$1

case "$file" in
    *.log|*.txt) echo "Processing text file: $file" ;;
    *.sh)        echo "Processing shell script: $file" ;;
    *)           echo "Unknown file type: $file" ;;
esac
```

## 🔗 Real DevOps Example
```bash
action=$1

case "$action" in
    start)   systemctl start nginx ;;
    stop)    systemctl stop nginx ;;
    restart) systemctl restart nginx ;;
    *)       echo "Usage: $0 {start|stop|restart}" ; exit 1 ;;
esac
```

## 🧠 Critical Nuances
- Patterns use globbing `(*, ?, [abc])`

- Quote variables in case `"$var"` in

- First match wins — subsequent patterns are ignored

## 🎯 Mnemonics
- `case … esac` → "Case closed."

- `*)` → Default branch (like else).

- `;;` → End of each case block.

## 🛠️ Demo Snippets

#### Service Control
```bash
case "$1" in
    start) systemctl start apache2 ;;
    stop)  systemctl stop apache2 ;;
    *)     echo "Usage: $0 {start|stop}" ;;
esac
```

#### User Role handling
```bash
role=$1
case "$role" in
    admin) echo "Full access granted" ;;
    user)  echo "Limited access granted" ;;
    guest) echo "Guest access only" ;;
    *)     echo "Unknown role: $role" ;;
esac
```

#### File Type Routing

```bash
case "$1" in
    *.conf) echo "Configuration file detected" ;;
    *.log)  echo "Log file detected" ;;
    *)      echo "Other file type" ;;
esac
```

#### Log Monitoring (Combining with `while` loop)

```bash
case "$1" in
    *.conf) echo "Configuration file detected" ;;
    *.log)  echo "Log file detected" ;;
    *)      echo "Other file type" ;;
esac
```