# watch Command

---

## Breakdown of Components

### [overview]
`watch` is a command-line utility that runs another command repeatedly at fixed intervals and displays its output in real time. It is useful for monitoring changes in system status, files, or processes.

---

### [options]
Control how the command is executed and displayed.

- `-n seconds` → set the interval between executions (default: 2 seconds)  
- `-d` → highlight differences between successive updates  
- `-t` → turn off the header showing interval and command  
- `-p` → attempt to run the command in precise intervals (compensates for command runtime)  
- `-g` → exit when the output of the command changes  
- `-c` → interpret ANSI color codes in the output  
- `-b` → beep if the command has a non-zero exit status  

---

## Example Usage

- `watch ls -l` → repeatedly run `ls -l` every 2 seconds  
- `watch -n 5 date` → display the current date every 5 seconds  
- `watch -d df -h` → monitor disk usage and highlight changes  
- `watch -n 1 -d cat /proc/meminfo` → watch memory info every second with differences highlighted  
- `watch -g ls /tmp` → exit when the contents of `/tmp` change  
- `watch -n 10 -c "curl -s http://example.com"` → run a curl request every 10 seconds, showing colored output if supported  

---

## Common Pitfalls

- Forgetting to quote complex commands (e.g., pipelines or commands with `|`) → always wrap them in quotes.  
- Using too short an interval (`-n 0.1`) can overload the system.  
- Some commands buffer output or require interactive input, which may not display correctly under `watch`.  

---

## Practical Use Cases

- Monitor disk usage: `watch -d df -h`  
- Track memory usage: `watch -n 1 free -m`  
- Observe process count: `watch "ps -ef | grep nginx"`  
- Watch log file growth: `watch -n 2 ls -lh /var/log/syslog`  

---
