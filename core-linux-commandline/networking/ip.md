## Breakdown of Components

### [starting-object]
The object to operate on (e.g., `link`, `addr`, `route`, `neigh`).  
**Example:** `ip addr` → show IP addresses assigned to interfaces.

---

### [options]
Control scope, output, and behavior.

- `-4` → show only IPv4 information  
- `-6` → show only IPv6 information  
- `-o` → one‑line output format  
- `-br` → brief output format (useful for quick checks)  
- `-s` → show statistics  
- `-json` → output in JSON format (if supported)  

---

### [tests]
Specify what to query or filter.

- `ip link show` → show network interfaces  
- `ip addr show` → show IP address details for all interfaces  
- `ip addr show dev eth0` → show addresses for a specific interface  
- `ip route show` → display routing table  
- `ip neigh show` → show ARP/neighbor table  
- `ip -4 addr show` → show only IPv4 addresses  
- `ip -6 route show` → show only IPv6 routes  

---

### [actions]
Perform changes or operations.

- `ip link set dev eth0 up` → bring interface up  
- `ip link set dev eth0 down` → bring interface down  
- `ip link set eth0 mtu 1400` → change the MTU of interface `eth0`  
- `ip addr add 192.168.1.100/24 dev eth0` → add IP address to interface  
- `ip addr del 192.168.1.100/24 dev eth0` → remove IP address from interface  
- `ip route add default via 192.168.1.1` → add default route  
- `ip route add 10.0.0.0/24 via 192.168.1.1` → add route to a specific network  
- `ip route del default` → delete default route  
- `ip neigh add 192.168.1.50 lladdr 00:11:22:33:44:55 dev eth0` → add static ARP entry  

---

## Example Usage

- `ip addr` → Show all IP addresses assigned to interfaces  
- `ip a` → Alias for `ip addr`, show all IP addresses  
- `ip addr show` → Show IP address details for all interfaces  
- `ip addr show dev eth0` → Show addresses for interface `eth0`  
- `ip addr show eth0` → Alternative syntax to show IP details for `eth0`  
- `ip link` → Show all network interfaces and their status  
- `ip link show` → Show all network interfaces (explicit form)  
- `ip -s link` → Show interface statistics  
- `ip link set dev eth0 up` → Bring interface `eth0` up  
- `ip link set eth0 up` → Enable interface `eth0` (alternative syntax)  
- `ip link set dev eth0 down` → Bring interface `eth0` down  
- `ip link set eth0 down` → Disable interface `eth0` (alternative syntax)  
- `ip link set eth0 mtu 1400` → Change the MTU of interface `eth0`  
- `ip route` → Show the routing table  
- `ip route add default via 10.0.0.1` → Set default gateway to `10.0.0.1`  
- `ip route add default via 192.168.1.1` → Set default gateway to `192.168.1.1`  
- `ip route add 10.0.0.0/24 via 192.168.1.1` → Add a route to a specific network  
- `ip route del default` → Delete default route  
- `ip neigh` → Show ARP/neighbor table  
- `ip neigh show` → Show ARP table (explicit form)  
- `ip neigh add 192.168.1.50 lladdr 00:11:22:33:44:55 dev eth0` → Add static ARP entry  
- `ip -br addr` → Show IP addresses in brief format  
- `ip -4 route show` → Show only IPv4 routes  
- `ip -6 addr show` → Show only IPv6 addresses  
