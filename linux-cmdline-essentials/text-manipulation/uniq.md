# `uniq`

## Breakdown of Components

### [starting-input]
The input stream or file containing lines of text, typically sorted or grouped.  
**Example:** `cat names.txt | uniq` → remove adjacent duplicate lines from names.txt.

---

### [options]
Control filtering and output behavior.

- `-c` → prefix lines with the number of occurrences  
- `-d` → only print duplicate lines (one copy)  
- `-u` → only print unique lines (non-duplicates)  
- `-i` → ignore case when comparing  
- `-f N` → skip first N fields when comparing  
- `-s N` → skip first N characters when comparing  
- `--help` → show help information  
- `--version` → show version information  

---

### [tests]
Conditions or variations for usage.

- Default → collapse adjacent duplicates, print one copy  
- With `-c` → useful for frequency counts  
- With `-d` → isolate repeated entries  
- With `-u` → isolate non-repeated entries  
- With `-i` → case-insensitive duplicate removal  

---

### [actions]
What to do with the input/output.

- Default → remove consecutive duplicates, print one copy  
- `uniq file.txt` → filter duplicates in file.txt  
- `uniq -c file.txt` → show counts of each line  
- `uniq -d file.txt` → show only duplicate lines  
- `uniq -u file.txt` → show only unique lines  
- Combine with `sort` → ensure duplicates are grouped before filtering  

---

## Example Usage

- `cat names.txt | uniq` → Remove adjacent duplicates from names.txt  
- `sort names.txt | uniq` → Remove duplicates after sorting  
- `uniq -c names.txt` → Show counts of each line  
- `uniq -d names.txt` → Show only duplicate lines  
- `uniq -u names.txt` → Show only unique lines  
- `cat data.txt | uniq -i` → Remove duplicates ignoring case  
- `uniq -f 1 file.txt` → Skip first field when comparing lines  
