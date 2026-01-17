## Breakdown of Components

### [starting-host]
The target host (domain name or IP address) to test connectivity.  
**Example:** `ping example.com` → send ICMP echo requests to example.com.

---

### [options]
Control count, interval, packet size, and output.

- `-c N` → send only *N* packets (e.g., `-c 4`)  
- `-i N` → set interval between packets in seconds (default is 1)  
- `-s N` → set packet size in bytes  
- `-t N` → set TTL (time to live) value  
- `-w N` → set timeout in seconds before ping exits  
- `-q` → quiet output (summary only)  
- `-v` → verbose output  

---

### [tests]
Specify what to query or verify.

- Default → check if host is reachable  
- `ping -c 4 example.com` → test connectivity with 4 packets  
- `ping -i 0.5 example.com` → test with 0.5 second interval  
- `ping -s 1024 example.com` → test with larger packet size  
- `ping -t 64 example.com` → test with