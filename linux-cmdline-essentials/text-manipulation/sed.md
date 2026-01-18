## Breakdown of Components

### [starting-input]
The input file or stream to process (e.g., `file.txt`, `cat file.txt | sed ...`).  
**Example:** `sed 's/foo/bar/' file.txt` → replace first occurrence of "foo" with "bar" per line.

---

### [options]
Control editing behavior, output, and execution.

- `-i` → edit files in place (overwrite original file)  
- `-n` → suppress automatic printing (only print when explicitly told)  
- `-e script` → add script to execute  
- `-f scriptfile` → read commands from a script file  
- `--help` → show help information  
- `--version` → show version information  

---

### [tests]
Conditions or patterns to match.

- `/pattern/` → match lines containing pattern  
- `/^#/` → match lines starting with `#` (comments)  
- `/^$/` → match blank lines  
- `1d` → delete the first line  
- `5,10p` → print lines 5 through 10  
- `NR==3` (via `-n '3p'`) → print only the 3rd line  

---

### [actions]
What to do with matched lines.

- `s/foo/bar/` → substitute first occurrence of "foo" with "bar" per line  
- `s/foo/bar/g` → substitute all occurrences of "foo" with "bar" per line  
- `s/[0-9]//g` → remove all digits from each line  
- `s/.*/[&]/` → wrap each line in square brackets  
- `d` → delete matched lines  
- `p` → print matched lines (when used with `-n`)  

---

## Example Usage

- `sed 's/foo/bar/' file.txt` → Replace first occurrence of "foo" with "bar" per line  
- `sed 's/foo/bar/g' file.txt` → Replace all occurrences of "foo" with "bar" per line  
- `sed -i 's/foo/bar/g' file.txt` → Same as above, but edits the file in place  
- `sed -n '3p' file.txt` → Print only the 3rd line of the file  
- `sed -n '5,10p' file.txt` → Print lines 5 through 10  
- `sed '/^#/d' file.txt` → Delete all lines starting with `#` (comments)  
- `sed '/^$/d' file.txt` → Delete all blank lines  
- `sed '1d' file.txt` → Delete the first line of the file  
- `sed 's/[0-9]//g' file.txt` → Remove all digits from the file  
- `sed 's/.*/[&]/' file.txt` → Wrap each line in square brackets  
- `sed -n '/error/p' logfile` → Print only lines containing "error"  
- `sed 's/ERROR/Warning/i' logfile` → Replace "ERROR" with "Warning" (case‑insensitive)  
- `sed '2,4d' file.txt` → Delete lines 2 through 4  
- `sed -e 's/foo/bar/' -e 's/baz/qux/' file.txt` → Apply multiple substitutions in one command  
- `echo "hello world" | sed 's/world/universe/'` → Replace "world" with "universe" from stdin  
