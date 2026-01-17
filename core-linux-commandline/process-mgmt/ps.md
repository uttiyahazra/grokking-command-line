# ps and kill Commands

---

## ps Command

### Breakdown of Components

#### [options]
Control the type and detail of process information displayed.

- `-e` → show all processes  
- `-f` → full-format listing (used with `-e` as `-ef`)  
- `-u username` → show processes for a specific user  
- `-p PID` → show info about a specific process ID  
- `aux` → BSD-style detailed listing of all processes  
- `--sort` → sort processes by a specific field (e.g., `%cpu`, `%mem`)  

---

### Example Usage

- `ps` → show processes for the current shell session  
- `ps -e` → show all processes  
- `ps -ef` → show all processes in full-format listing  
- `ps aux` → show detailed info for all processes (BSD-style)  
- `ps -u username` → show processes for a specific user  
- `ps -p 1234` → show info about process with PID 1234  
- `ps -ef | grep nginx` → find all processes related to "nginx"  
- `ps --sort=-%mem | head` → show top memory-consuming processes  
- `ps --sort=-%cpu | head` → show top CPU-consuming processes  

---

## kill Command

### Breakdown of Components

#### [signals]
Control how a process is terminated.

- `SIGTERM (15)` → default, graceful termination  
- `SIGKILL (9)` → forceful termination, cannot be caught or ignored  
- `SIGHUP (1)` → hangup, often used to restart a process  
- `-l` → list all available signals  

#### [variants]
Other related commands for killing processes.

- `pkill` → kill processes by name  
- `killall` → kill all processes matching a name  
- `xkill` → graphically click on a window to kill it (X11 systems)  

---

### Example Usage

- `kill PID` → send default SIGTERM to the process with given PID  
- `kill -9 PID` → forcefully kill a process using SIGKILL  
- `kill -15 PID` → gracefully stop a process (SIGTERM, same as default)  
- `kill -HUP PID` → restart a process by sending SIGHUP  
- `kill -l` → list all available signals  
- `pkill processname` → kill a process by its name  
- `pkill -9 processname` → forcefully kill all processes with that name  
- `killall processname` → kill all processes matching the exact name  
- `xkill` → graphically click on a window to kill it (X11 systems)  
