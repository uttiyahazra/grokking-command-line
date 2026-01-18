# `pgrep`

## Breakdown of Components

### [starting-input]
The process table of the system, searched by **name pattern** or other criteria.  
**Example:** `pgrep nginx` → returns the PID(s) of all running `nginx` processes.

---

### [options]
Control how processes are matched and displayed.

- `-l` → list PID with process name  
- `-a` → list PID with full command line  
- `-u USER` → match processes owned by a specific user  
- `-P PPID` → match processes with a specific parent PID  
- `-f` → match against the full command line (not just the process name)  
- `-n` → return only the newest (most recent) matching process  
- `-o` → return only the oldest matching process  
- `-d DELIM` → specify delimiter for output when multiple PIDs are returned  
- `--help` → show help information  
- `--version` → show version information  

---

### [tests]
Conditions or variations for usage.

- Default → return all PIDs matching the given name  
- With `-l` → useful for seeing both PID and process name  
- With `-a` → helpful to see full command line arguments  
- With `-u` → filter by user ownership  
- With `-n` or `-o` → isolate newest or oldest process instance  

---

### [actions]
What to do with the input/output.

- Default → return PID(s) of matching processes  
- `pgrep nginx` → find all PIDs of `nginx` processes  
- `pgrep -l sshd` → list PIDs with process names for `sshd`  
- `pgrep -u root` → find processes owned by root  
- `pgrep -f python` → match processes with "python" anywhere in the command line  
- `pgrep -n java` → return the most recent Java process  
- `pgrep -o java` → return the oldest Java process  

---

## Example Usage

- `pgrep nginx` → Return PIDs of all `nginx` processes  
- `pgrep -l sshd` → Show PIDs and names of SSH daemon processes  
- `pgrep -u postgres` → Show PIDs of processes owned by `postgres` user  
- `pgrep -f "python script.py"` → Match full command line containing `python script.py`  
- `pgrep -n java` → Show PID of the most recent Java process  
- `pgrep -o java` → Show PID of the oldest Java process  
- `pgrep -P 1` → Show processes whose parent PID is 1 (typically `init` or `systemd`)  
- `pgrep -d , nginx` → Return PIDs of nginx processes separated by commas  

