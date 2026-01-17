## Breakdown of Components

### [starting-stream]
The output stream where a program writes its results.  
- **stdout (standard output)** → default stream for normal program output.  
- **stderr (standard error)** → stream for error messages and diagnostics.  

**Example:** `ls` → writes directory listing to **stdout**.  
**Example:** `ls /nonexistent` → writes error message to **stderr**.

---

### [options]
Control redirection and handling of streams.

- `>` → redirect **stdout** to a file (overwrite)  
- `>>` → redirect **stdout** to a file (append)  
- `2>` → redirect **stderr** to a file (overwrite)  
- `2>>` → redirect **stderr** to a file (append)  
- `&>` → redirect both **stdout** and **stderr** to a file (overwrite)  
- `2>&1` → merge **stderr** into **stdout**  
- `|` → pipe **stdout** into another command  

---

### [tests]
Conditions or variations for stream usage.

- `command > output.txt` → save normal output to file  
- `command 2> error.txt` → save error messages to file  
- `command > out.txt 2> err.txt` → separate stdout and stderr into different files  
- `command &> all.txt` → redirect both stdout and stderr to one file  
- `command 2>&1 | tee combined.log` → merge stderr into stdout and log both  

---

### [actions]
What to do with the streams.

- Redirect to file → capture output or errors for later review  
- Append to file → accumulate logs over time  
- Merge streams → combine stdout and stderr into one stream  
- Pipe stdout → feed output into another command for processing  
- Discard output → redirect to `/dev/null` to ignore  

---

## Example Usage

- `ls > files.txt` → Save directory listing (stdout) to files.txt  
- `ls /nonexistent 2> errors.txt` → Save error message (stderr) to errors.txt  
- `ls > out.txt 2> err.txt` → Separate stdout and stderr into different files  
- `ls /nonexistent &> all.txt` → Redirect both stdout and stderr to all.txt  
- `ls /nonexistent > out.txt 2>&1` → Merge stderr into stdout and save to out.txt  
- `ls | grep ".txt"` → Pipe stdout into grep to filter `.txt` files  
- `ls > /dev/null` → Discard stdout (ignore normal output)  
- `ls /nonexistent 2> /dev/null` → Discard stderr (ignore error messages)  
- `ls /nonexistent 2>&1 | tee combined.log` → Merge stdout and stderr, then log both to combined.log  
