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
## Example Usage

- `find . -name "*.log"` → Find all `.log` files in the current directory
- `find /path/to/search -type f -size +1M` → Find files over 1MB in `/path/to/search`
- `find /path/to/search -type f -mmin -10` → Find files modified less than 10 minutes ago
- `find /path/to/search -type f -mtime -1` → Find files modified less than 1 day ago
- `find /path/to/search -type d` → Find directories instead of files
