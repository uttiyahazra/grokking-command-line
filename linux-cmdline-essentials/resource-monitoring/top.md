# top Command

---

## Breakdown of Components

### [options]
Control how system resource usage is displayed.

- `-b` → batch mode (non-interactive, plain text output for scripts)  
- `-n <N>` → number of iterations (snapshots to display before exiting)  
- `-bn1` → batch mode with a single snapshot (commonly used in scripts)  

---

## Example Usage

- `top` → interactive view of CPU, memory, and processes (press `q` to quit)  
- `top -bn1` → one-time snapshot in batch mode (non-interactive)  
- `top -bn1 | grep "Cpu(s)"` → display only the CPU usage summary line  
- `top -bn1 | grep "Mem"` → display only the memory usage summary line  
- `top -bn1 | grep "Cpu(s)" | awk '{print "CPU Used: " 100 - $8 "% / Total: 100%"}'` → calculate and show total CPU usage (100 minus idle percentage)  
- `top -bn1 | grep "MiB Mem"    | awk '{print "Memory Used: "$6"MB / Total: "$4"MB" }'` → show physical memory (not swap) used vs total in a user-friendly format  
- ```
