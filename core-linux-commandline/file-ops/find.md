## Breakdown of Components

### [starting-path]
Where to begin searching (e.g., `.`, `/home/user`, `/var/log`).  
**Example:** `.` → current directory.

---

### [options]
Control depth, traversal, performance.

- `-maxdepth N` → limit recursion depth  
- `-mindepth N` → skip shallow levels  
- `-follow` → follow symlinks  

---

### [tests]
Conditions to match files/directories.

- `-type f` → regular files  
- `-type d` → directories  
- `-name "*.txt"` → match by name  
- `-size +1M` → larger than 1 MB  
- `-mtime -7` → modified in less than last 7 days  
- `-mtime +7` → modified in more than last 7 days
- `-mtime  7` → modified in exactly 7 days

---

### [actions]
What to do with matches.

- `-print` → default, show results  
- `-exec command {} \;` → run a command on each match  
- `-delete` → remove matches  
- `-ls` → detailed listing  

## Example Usage
- For example the following `find` command finds the files in `/var/log` folder (within a single recursion depth), matching with `*.log` name and executes an `ls` operation on those serach results.

```bash
ubuntu:~$ find /var/log -maxdepth 1 -type f -name "*.log" -exec ls {} +

/var/log/alternatives.log  /var/log/dpkg.log        /var/log/ubuntu-advantage-apt-hook.log
/var/log/auth.log          /var/log/fontconfig.log  /var/log/updater_stderr.log
/var/log/bootstrap.log     /var/log/kern.log        /var/log/updater_stdout.log
```