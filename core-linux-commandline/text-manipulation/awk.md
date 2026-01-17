## Breakdown of Components

### [starting-input]
The input file or stream to process (e.g., `file.txt`, `cat file.txt | awk ...`).  
**Example:** `awk '{print $1}' file.txt` → print the first column from file.txt.

---

### [options]
Control behavior, field separators, and execution.

- `-F fs` → set input field separator (e.g., `-F,` for CSV)  
- `-v var=value` → assign a variable before execution  
- `-f script.awk` → run commands from a script file  
- `--help` → show help information  
- `--version` → show version information  

---

### [tests]
Conditions or patterns to match lines.

- `/pattern/` → match lines containing pattern  
- `NR==1` → match only the first line  
- `NR>1` → skip header line  
- `$3 > 100` → match rows where third column > 100  
- `$1 == "ERROR"` → match rows where first column equals "ERROR"  

---

### [actions]
What to do with matched lines.

- `{print $1}` → print first column  
- `{print $1, $3}` → print first and third columns  
- `{sum += $2} END {print sum}` → calculate sum of second column  
- `{count++} END {print count}` → count number of lines  
- `{print NR, $0}` → print line number and full line  

---

## Example Usage

- `awk '{print $1}' file.txt` → Print the first column from file.txt  
- `awk -F, '{print $2}' data.csv` → Print the second column from a CSV file  
- `awk '/error/ {print $0}' logfile` → Print lines containing "error" from logfile  
- `awk '{sum += $3} END {print sum}' sales.txt` → Calculate sum of third column in sales.txt  
- `awk 'NR==1 {print $0}' file.txt` → Print only the first line (header)  
- `awk 'NR>1 {print $1}' file.txt` → Skip header and print first column  
- `awk '{print NR, $0}' file.txt` → Print line number and full line  
