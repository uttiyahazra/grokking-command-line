## Breakdown of Components

### [starting-url]
The target URL to download from (e.g., `https://example.com/file.zip`).  
**Example:** `wget https://example.com/file.zip` → download file.zip from example.com.

---

### [options]
Control download behavior, output, and performance.

- `-O file` → save download with a specific filename  
- `-c` → continue a partially downloaded file (resume)  
- `-b` → run in background  
- `-q` → quiet mode (no output)  
- `-nv` → non‑verbose mode (minimal output)  
- `-r` → recursive download  
- `-l N` → set recursion depth (e.g., `-l 2`)  
- `-np` → no parent (don’t ascend to parent directories)  
- `-m` → mirror a website (recursive + timestamping + other options)  
- `--limit-rate=200k` → limit download speed  
- `--user=username --password=password` → use authentication  
- `--no-check-certificate` → ignore SSL certificate errors  

---

### [tests]
Specify conditions or filters for downloads.

- `wget -r -l 1 https://example.com` → recursive download with depth 1  
- `wget --limit-rate=100k https://example.com/file.zip` → throttle download speed  
- `wget --no-check-certificate https://example.com/securefile` → ignore SSL certificate errors  
- `wget -c https://example.com/file.zip` → resume a partially downloaded file  

---

### [actions]
What to do with the downloaded content.

- Default → save file in current directory  
- `-O file.txt` → save with custom filename  
- `-P /path/to/dir` → save files to specific directory  
- `-r` → recursively download linked files  
- `-m` → mirror entire website  
- `-b` → run download in background  
- Redirect logs → `wget -b https://example.com/file.zip` → logs saved to `wget-log`  

---

## Example Usage

- `wget https://example.com/file.zip` → Download a file from example.com  
- `wget -O newfile.zip https://example.com/file.zip` → Save file as `newfile.zip`  
- `wget -c https://example.com/file.zip` → Resume a partially downloaded file  
- `wget -b https://example.com/file.zip` → Download file in background  
- `wget -q https://example.com/file.zip` → Quiet mode (no output)  
- `wget -r -l 2 https://example.com/docs/` → Recursively download with depth 2  
- `wget -np -r https://example.com/files/` → Recursively download without ascending to parent directories  
- `wget -m https://example.com` → Mirror an entire website  
- `wget --limit-rate=200k https://example.com/file.zip` → Limit download speed to 200 KB/s  
- `wget --user=admin --password=secret https://example.com/protected/file.zip` → Download with authentication  
- `wget --no-check-certificate https://example.com/securefile.zip` → Ignore SSL certificate errors  
- `wget -P /tmp/downloads https://example.com/file.zip` → Save file into `/tmp/downloads` directory  
