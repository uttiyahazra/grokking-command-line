# 🔧 Bash Functions — Quick Reference
> "Functions are reusable building blocks: define once, call anywhere."

## 🔑 Basic Syntax
```bash
function_name () {
    COMMANDS
    return CODE
}
```
or

```bash
function function_name {
    COMMANDS
    return CODE
}

```
- `function_name` → Identifier used to call the function.

- `COMMANDS` → Commands executed when the function is called.

- `return CODE` → Optional exit code (0 = success, non‑zero = failure).

## 📊 Defining and Calling Functions

```bash
#!/bin/bash

say_hello () {
    echo "Hello, $1!"
}

# Call function with argument
say_hello "User"
```

## 📂 Functions with Multiple Arguments

```bash
deploy_app () {
    APP=$1
    ENV=$2
    echo "Deploying $APP to $ENV environment..."
    # Example: kubectl apply -f "$APP-$ENV.yaml"
}

deploy_app "webapp" "production"
```

## 🔗 Real DevOps Example (Service Control)
```bash
#!/bin/bash

start_service () {
    systemctl start "$1"
    echo "Service $1 started"
}

stop_service () {
    systemctl stop "$1"
    echo "Service $1 stopped"
}

restart_service () {
    systemctl restart "$1"
    echo "Service $1 restarted"
}

case "$2" in
    start)   start_service "$1" ;;
    stop)    stop_service "$1" ;;
    restart) restart_service "$1" ;;
    *)       echo "Usage: $0 <service> {start|stop|restart}" ;;
esac
```

## 🧠 Critical Nuances
**Scope**  
- Variables inside functions are global by default. Use local to limit scope.

```bash
myfunc () {
    local temp="only inside function"
    echo "$temp"
}
```

**Return vs Exit**

- `return` → sets function’s exit code (0–255).

- `exit` → terminates the entire script.

**Arguments inside functions**

- `$1, $2, … `→ function arguments.

- `$@` → all arguments.

- `$#` → number of arguments.

## 🎯 Mnemonics
- `function_name () { … }` → "Define once, reuse everywhere."

- `local` → "Keep it inside."

- `return` → "Signal success/failure."

```bash
Define → Call → Execute → Return Code
```

## 🛠️ Demo Snippets

#### Health Check Function
```bash
health_check () {
    ping -c 1 "$1" > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$1 is reachable"
        return 0
    else
        echo "$1 is not reachable"
        return 1
    fi
}

health_check "example.com"
```

#### Function Library
```bash
backup_db () {
    pg_dump "$1" > "/backups/$1.sql"
    echo "Database $1 backed up"
}

cleanup_logs () {
    find /var/log -name "*.log" -mtime +7 -delete
    echo "Old logs cleaned"
}

# Call functions
backup_db "mydb"
cleanup_logs
```

#### Embedding Functions in Loops
```bash
check_services () {
    for svc in "$@"; do
        systemctl is-active --quiet "$svc"
        if [ $? -eq 0 ]; then
            echo "✅ $svc is running"
        else
            echo "❌ $svc is not running"
        fi
    done
}

check_services nginx mysql redis
```