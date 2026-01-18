## Breakdown of Components

### [starting-input]
The input stream or command output to split and write.  
**Example:** `echo "hello" | tee file.txt` → write "hello" to both stdout and file.txt.

---

### [options]
Control writing behavior and output.

- `-a` → append to the file(s) instead of overwriting  
- `-i` → ignore interrupts (continue writing even if interrupted)  
- `--help` → show help information  
- `--version` → show version information  

---

### [tests]
Conditions or variations for usage.

- Default → write input to both stdout and file(s)  
- With `-a` → append mode, useful for logs  
- With multiple files → duplicate output to several files simultaneously  

---

### [actions]
What to do with the input/output.

- Default → display input on stdout and write to file(s)  
- `tee file.txt` → overwrite file.txt with input  
- `tee -a file.txt` → append input to file.txt  
- `tee file1.txt file2.txt` → write input to multiple files  
- Combine with pipes → capture and log intermediate command output  

---

## Example Usage

- `echo "hello world" | tee file.txt` → Write "hello world" to stdout and file.txt  
- `ls -l | tee files.txt` → Save directory listing to files.txt while still showing it on screen  
- `ls -l | tee -a files.txt` → Append directory listing to files.txt  
- `dmesg | tee dmesg.log` → Save kernel messages to dmesg.log while displaying them  
- `cat data.txt | tee copy.txt` → Duplicate contents of data.txt into copy.txt  
- `echo "log entry" | tee -a logfile.txt` → Append "log entry" to logfile.txt  
- `command | tee output1.txt output2.txt` → Write command output to multiple files  
- `make 2>&1 | tee build.log` → Capture both stdout and stderr into build.log while showing output  
