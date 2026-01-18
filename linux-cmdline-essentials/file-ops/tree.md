## Breakdown of Components

### [starting-path]
Where to begin displaying the directory tree (e.g., `.`, `/home/user`, `/var/log`).  
**Example:** `.` → current directory.

---

### [options]
Control depth, display style, and filtering.

- `-L N` → limit recursion depth to *N* levels  
- `-d` → list directories only  
- `-f` → print full path prefix for each file  
- `-a` → include hidden files (those starting with `.`)  
- `-I pattern` → exclude files matching pattern  
- `-C` → colorize output  

---

### [tests]
Conditions to refine what is shown.

- `-P pattern` → include only files matching pattern  
- `-I pattern` → exclude files matching pattern  
- `-prune` → skip directories that match pattern  
- `--dirsfirst` → list directories before files  

---

### [actions]
What to do with matches / how to display.

- Default → print hierarchical tree view  
- `-o file.txt` → output results to a file  
- `-s` → show file sizes  
- `-h` → human-readable sizes (e.g., KB, MB)  
- `-D` → show last modification date  

---

## Example Usage

- `tree` → Display the directory tree of the current directory  
- `tree -L 2` → Show directory tree up to depth 2  
- `tree -d` → Show only directories  
- `tree -a` → Include hidden files in the tree  
- `tree -I "*.log"` → Exclude all `.log` files from the tree  
- `tree /var/log -L 1` → Show `/var/log` contents with depth limited to 1  
- `tree -f` → Show full path for each file  
- `tree -s -h` → Show file sizes in human-readable format  
