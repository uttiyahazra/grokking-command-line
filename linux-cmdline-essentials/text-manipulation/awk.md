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
- `echo "foo bar baz qux" | awk '{print "Second: "$2" / Third: "$3}'` → Prints output in format `Second: bar / Third: baz`

### Practical DevOps Scenario(s)
Let's consider following imaginary access.log

```bash
192.168.1.100 - - [07/Feb/2026:11:47:00 +0100] "GET /index.html HTTP/1.1" 200 1234 "-" "Mozilla/5.0"
10.0.0.50 - admin [07/Feb/2026:11:47:15 +0100] "POST /login HTTP/1.1" 302 0 "https://example.com" "curl/7.68"
192.168.1.100 - - [07/Feb/2026:11:47:30 +0100] "GET /api/users HTTP/1.1" 200 5678 "-" "Mozilla/5.0"
172.16.0.10 - - [07/Feb/2026:11:47:45 +0100] "GET /style.css HTTP/1.1" 200 2048 "-" "Mozilla/5.0"
```
- `awk '{print $1}' access.log | sort | uniq -c | sort -nr`

   → `awk '{print $1}' /var/log/access.log`: Extracts the first field (client IP) from each log line.

   → `sort`: Alphabetically sorts the IPs for uniq to group duplicates.

   → `uniq -c`: Counts occurrences of each unique IP, outputting lines like " 3 192.168.1.100".

   → `sort -nr`: Numerically sorts (-n) those counts in reverse (-r) order, so highest-count IPs appear first.

   so, essentially its output will be as below:
   ```bash
      2 192.168.1.100
      1 172.16.0.10
      1 10.0.0.50
   ```

- `awk '{print $1 " -> " $6}' access.log` 
   → prints intended 1st field (IP-Address) & 6th field (HTTP-Operation) in a user-defined custom printout.
   It's output in this case will be:
   ```bash
   192.168.1.100 -> "GET
   10.0.0.50 -> "POST
   192.168.1.100 -> "GET
   172.16.0.10 -> "GET
   ```

Let's consider now this `df -h` sample output:

   ```bash
    ubuntu:~$ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    none            3.8G     0  3.8G   0% /usr/lib/modules/6.6.87.2-microsoft-standard-WSL2
    none            3.8G  4.0K  3.8G   1% /mnt/wsl
    drivers         264G  212G   52G  81% /usr/lib/wsl/drivers
    /dev/sdd       1007G  2.1G  954G   1% /
    none            3.8G   76K  3.8G   1% /mnt/wslg
    none            3.8G     0  3.8G   0% /usr/lib/wsl/lib
    rootfs          3.8G  2.7M  3.7G   1% /init
    none            3.8G  496K  3.8G   1% /run
    none            3.8G     0  3.8G   0% /run/lock
    none            3.8G     0  3.8G   0% /run/shm
    none            3.8G   76K  3.8G   1% /mnt/wslg/versions.txt
    none            3.8G   76K  3.8G   1% /mnt/wslg/doc
    C:\             264G  212G   52G  81% /mnt/c
    D:\             213G  269M  212G   1% /mnt/d
    tmpfs           759M   20K  759M   1% /run/user/1000
```
- `df -h|awk '$1 == "/dev/sdd" {print $1 " has total disk-size of " $2 " and uses " $3 " of it."}'`
   → This piped awk operation 1st looks for match to value "/dev/sdd" and enables a custom user-defined print out with intended field value."

   In this case, its output looks like:
   ```bash
   /dev/sdd has total disk-size of 1007G and uses 2.1G of it.
   ```
