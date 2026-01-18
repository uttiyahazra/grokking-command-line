# df Command

---

## Breakdown of Components

### [options]
Control how disk space usage is displayed.

- `-h` → human-readable output (KB, MB, GB)  
- `-a` → include pseudo, duplicate, and inaccessible filesystems  
- `-T` → show filesystem type  
- `-i` → show inode information instead of block usage  
- `--total` → produce a grand total  

---

## Example Usage

- `df` → show disk space usage for mounted filesystems  
- `df -h /path/to/directory` → show disk space usage for ``/path/to/directory` → any directory you want to check (e.g., /var/log).
- `df -h` → human-readable disk usage (e.g., GB/MB)  
- `df -a` → include all filesystems, even pseudo and special ones  
- `df -T` → show filesystem type along with usage  
- `df -i` → show inode usage instead of block usage  
- `df --total` → display a grand total of all filesystems  
