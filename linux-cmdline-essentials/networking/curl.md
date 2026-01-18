## Breakdown of Components

### [starting-url]
The target URL to fetch or interact with (e.g., `https://example.com`, `http://localhost:8080`).  
**Example:** `https://example.com` → fetch content from example.com.

---

### [options]
Control request type, headers, authentication, and output.

- `-X METHOD` → specify HTTP method (GET, POST, PUT, DELETE)  
- `-I` → fetch only headers (HEAD request)  
- `-L` → follow redirects  
- `-o file` → write output to file  
- `-O` → save output with remote filename  
- `-s` → silent mode (no progress or errors)  
- `-v` → verbose output (debugging)  
- `-u user:pass` → basic authentication  

---

### [tests]
Conditions or filters for requests.

- `-H "Header: value"` → add custom header  
- `-d "key=value"` → send POST data  
- `--data-binary @file.json` → send raw file data  
- `--limit-rate 100k` → throttle download speed  
- `--max-time 10` → timeout after 10 seconds  

---

### [actions]
What to do with the response.

- Default → print response body to stdout  
- `-o file.txt` → save response to file  
- `-w "%{http_code}"` → output HTTP status code  
- `-c cookies.txt` → save cookies  
- `-b cookies.txt` → send cookies  

---

## Example Usage

- `curl https://example.com` → Fetch the HTML content of example.com  
- `curl -I https://example.com` → Fetch only headers from example.com  
- `curl -L https://example.com` → Follow redirects until final destination  
- `curl -o page.html https://example.com` → Save output to `page.html`  
- `curl -X POST -d "username=admin&password=xxxx" https://example.com/login` → Send POST form data  
- `curl -H "Authorization: Bearer TOKEN" https://api.example.com/data` → Send request with custom header  
- `curl -u user:pass https://example.com/secure` → Access with basic authentication  
- `curl --data-binary @data.json https://api.example.com/upload` → Upload raw JSON file  
- `curl -w "%{http_code}" -s -o /dev/null https://example.com` → Check only HTTP status code  
