## Breakdown of Components

### [starting-host]
The system’s hostname (network name of the machine).  
**Example:** Running `hostname` without arguments → prints the current system hostname.

---

### [options]
Control display, setting, and network details.

- `-f` → show the FQDN (Fully Qualified Domain Name)  
- `-s` → show the short hostname (first part before domain)  
- `-i` → show the IP address(es) of the host  
- `-d` → show the DNS domain name  
- `-y` → show the NIS/YP domain name  
- `-F file` → set hostname from a file  
- `-b` → set hostname only if not already set  

---

### [tests]
Conditions or variations for hostname queries.

- Default → print current hostname  
- `hostname -f` → check if system resolves to a valid FQDN  
- `hostname -d` → verify domain part of hostname  
- `hostname -i` → confirm IP resolution of hostname  

---

### [actions]
What to do with the hostname.

- Default → display hostname  
- `hostname newname` → set a new hostname (requires root privileges)  
- `hostname -F /etc/hostname` → set hostname from file  
- `hostnamectl` (systemd alternative) → manage hostname persistently  

---

## Example Usage

- `hostname` → Show the current system hostname  
- `hostname -f` → Show the fully qualified domain name (FQDN)  
- `hostname -s` → Show the short hostname (without domain)  
- `hostname -i` → Show the IP address(es) of the host  
- `hostname -d` → Show the DNS domain name  
- `hostname -y` → Show the NIS/YP domain name  
- `sudo hostname newhost` → Temporarily set hostname to `newhost`  
- `sudo hostname -F /etc/hostname` → Set hostname from `/etc/hostname` file  
- `hostnamectl set-hostname newhost` → Persistently set hostname using systemd  
