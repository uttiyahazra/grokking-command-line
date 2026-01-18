## Breakdown of Components

### [starting-input]
The file(s) or stream to search through (e.g., `file.txt`, `cat file.txt | grep ...`).  
**Example:** `grep "error" logfile.txt` → search for the word "error" in logfile.txt.

---

### [options]
Control matching, output, and performance.

- `-i` → ignore case distinctions  
- `-v` → invert match (show lines that do *not* match)  
- `-r` or `-R` → recursive search through directories  
- `-n` → show line numbers with output  
- `-c` → count matching lines  
- `-l` → list filenames with matches  
- `-L` → list filenames without matches  
- `-o` → show only the matching part of the line  
- `-e pattern` → specify multiple patterns  
- `-E` → use extended regular expressions (ERE)  
- `-w` → match whole words only  
- `-x` → match whole lines only  
- `-C N` → show N lines of context around each match  

---

### [tests]
Conditions or patterns to match.

- `"error"` → match lines containing the word "error"  
- `^ERROR` → match lines starting with "ERROR"  
- `foo$` → match lines ending with "foo"  
- `[0-9]` → match any digit  
- `^[A-Z]` → match lines starting with a capital letter  
- `.*pattern.*` → match any line containing "pattern"  

---

### [actions]
What to do with matched lines.

- Default → print matching lines  
- `-c` → count matches instead of printing lines  
- `-l` → print only filenames with matches  
- `-L` → print only filenames without matches  
- `-o` → print only the matching portion of each line  
- `-C N` → include N lines of context before and after matches  
- Combine with pipes → `command | grep pattern` to filter output  

---

## Example Usage

- `grep "error" logfile.txt` → Search for "error" in logfile.txt  
- `grep -i "error" logfile.txt` → Case‑insensitive search for "error"  
- `grep -v "success" logfile.txt` → Show lines that do *not* contain "success"  
- `grep -n "error" logfile.txt` → Show line numbers with matches  
- `grep -c "error" logfile.txt` → Count number of lines containing "error"  
- `grep -l "error" *.log` → List log files that contain "error"  
- `grep -L "error" *.log` → List log files that do *not* contain "error"  
- `grep -r "TODO" src/` → Recursively search for "TODO" in `src/` directory  
- `grep -w "main" file.c` → Match whole word "main" in file.c  
- `grep -x "Hello World" file.txt` → Match whole line "Hello World"  
- `grep -E "error|warning" logfile.txt` → Search for either "error" or "warning" using extended regex  
- `grep -o "[0-9]\+" numbers.txt` → Print only the numbers from each line  
- `grep -C3 keyword somefile.txt` → Show 3 lines of context before and after each match for "keyword"  
- `dmesg | grep -i usb` → Filter kernel messages for "usb" (case‑insensitive)  
- `ps aux | grep nginx` → Find running processes related to nginx  
