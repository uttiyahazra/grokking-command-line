# du Command

---

## Breakdown of Components

### [options]
Control how disk usage of files/directories is calculated.

- `-h` → human-readable output (KB, MB, GB)  
- `-s` → summarize total size of each argument  
- `-a` → show sizes of all files, not just directories  
- `-c` → produce a grand total  
- `--max-depth=N` → limit recursion depth to N  

---

## Example Usage

- `du` → show disk usage of current directory and subdirectories  
- `du -h` → human-readable disk usage  
- `du -s` → summarize total size of current directory  
- `du -sh /var/log` → show total size of `/var/log` in human-readable format  
- `du -a` → show sizes of all files and directories  
- `du -c` → display a grand total at the end  
- `du --max-depth=1` → show sizes of directories one level deep  
- `du -sh *` → show sizes of all items in current directory  
