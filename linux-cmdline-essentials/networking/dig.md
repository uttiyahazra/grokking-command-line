## Breakdown of Components

### [starting-host]
The domain name or hostname to query (e.g., `example.com`, `google.com`).  
**Example:** `example.com` → query DNS records for example.com.

---

### [options]
Control query type, server, and output formatting.

- `@server` → specify DNS server to query (e.g., `@8.8.8.8`)  
- `+short` → concise output (just the answer)  
- `+noall +answer` → show only the answer section  
- `+trace` → trace delegation path from root servers  
- `+stats` → show query statistics  
- `+time=N` → set timeout in seconds  
- `+retry=N` → number of retries  

---

### [tests]
Specify record types or conditions.

- `A` → IPv4 address record  
- `AAAA` → IPv6 address record  
- `MX` → mail exchange record  
- `NS` → name server record  
- `CNAME` → canonical name (alias) record  
- `TXT` → text record  
- `SOA` → start of authority record  

---

### [actions]
What to do with the query results.

- Default → print full DNS response  
- `+short` → show only resolved values  
- `+noall +answer` → filter to answer section  
- `+trace` → follow DNS resolution path step by step  
- Redirect output → `dig example.com > result.txt`  

---

## Example Usage

- `dig example.com` → Perform a basic DNS lookup for A record  
- `dig example.com A` → Explicitly query for the A (IPv4 address) record  
- `dig example.com AAAA` → Query for the IPv6 address (AAAA record)  
- `dig example.com MX` → Query mail exchange (MX) records  
- `dig example.com NS` → Query name server (NS) records  
- `dig example.com TXT` → Query for TXT records (e.g., SPF, DKIM info)  
- `dig @8.8.8.8 example.com` → Use a specific DNS server (e.g., Google DNS)  
- `dig +short example.com` → Output only the result (useful for scripts)  
- `dig +noall +answer example.com` → Show only the answer section  
- `dig -x 8.8.8.8` → Perform a reverse DNS lookup  
- `dig +trace example.com` → Trace DNS path from root servers to authoritative server  
