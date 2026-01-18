## Breakdown of Components

### [starting-object]
The type of sockets or protocol family to query (e.g., TCP, UDP, UNIX).  
**Example:** `ss -t` → show TCP sockets.

---

### [options]
Control filtering, output format, and details.

- `-t` → show TCP sockets  
- `-u` → show UDP sockets  
- `-l` → show listening sockets only  
- `-a` → show all sockets (listening and non‑listening)  
- `-p` → show process using each socket  
- `-n` → show numeric addresses/ports (no DNS resolution)  
- `-s` → display summary statistics  
- `-H` → suppress header line in output  

---

### [tests]
Specify conditions or filters for sockets.

- `ss -tuln` → show all listening TCP/UDP ports in numeric form  
- `ss -o state established '( dport = :ssh )'` → show established SSH connections  
- `ss -tnp` → show TCP sockets with process info  
- `ss -u` → show UDP sockets only  
- `ss -t` → show TCP sockets only  

---

### [actions]
What to do with the results.

- Default → print socket connections summary  
- Filter by protocol → `-t`, `-u`, `-x` (UNIX sockets)  
- Filter by state → `-o state established`  
- Show processes → `-p`  
- Show statistics → `-s`  
- Redirect output → `ss -tuln > ports.txt`  

---

## Example Usage

- `ss` → Show summary of socket connections  
- `ss -t` → Show only TCP connections  
- `ss -u` → Show only UDP connections  
- `ss -l` → Show listening sockets only  
- `ss -a` → Show all sockets (listening and non‑listening)  
- `ss -tuln` → Show all listening TCP/UDP ports in numeric form  
- `ss -s` → Display summary statistics  
- `ss -p` → Show process using each socket  
- `ss -tnp` → Show TCP sockets with process info  
- `ss -o state established '( dport = :ssh )'` → Show established SSH connections  
- `ss -H` → Suppress header line in output  
- `ss -n` → Show numeric addresses and ports (no DNS resolution)  
- `ss -x` → Show UNIX domain sockets  
- `ss -4` → Show only IPv4 sockets  
- `ss -6` → Show only IPv6 sockets  
- `ss -t state listening` → Show only listening TCP sockets  
- `ss -u state established` → Show established UDP sockets  
