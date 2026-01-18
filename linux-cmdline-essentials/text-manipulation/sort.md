# `sort`

## Breakdown of Components

### [starting-input]
The input stream or file containing lines of text to order.  
**Example:** `cat numbers.txt | sort` → sort numbers.txt in ascending order.

---

### [options]
Control sorting behavior and output.

- `-r` → reverse order (descending)  
- `-n` → numeric sort (compare numbers)  
- `-k N` → sort by specific field/column  
- `-u` → unique sort (remove duplicates)  
- `-f` → fold case (ignore case differences)  
- `-o FILE` → write result to FILE  
- `-t CHAR` → specify field separator  
- `--help` → show help information  
- `--version` → show version information  

---

### [tests]
Conditions or variations for usage.

- Default → sort lines lexicographically (alphabetical order)  
- With `-n` → numeric sort, useful for numbers  
- With `-r` → reverse order  
- With `-k` → sort by specific column/field  
- With `-u` → remove duplicates while sorting  

---

### [actions]
What to do with the input/output.

- Default → sort lines alphabetically  
- `sort file.txt` → sort file.txt in ascending order  
- `sort -r file.txt` → sort file.txt in descending order  
- `sort -n file.txt` → sort numerically  
- `sort -k 2 file.txt` → sort by second field  
- `sort -u file.txt` → sort and remove duplicates  
- `sort -t , -k 3 file.csv` → sort CSV by third column  

---

## Example Usage

- `sort names.txt` → Sort names alphabetically  
- `sort -r names.txt` → Sort names in reverse order (largest first) 👉 By default, sort compares the first column of each line.
- `sort -n numbers.txt` → Sort numbers numerically  
- `sort -u names.txt` → Sort and remove duplicates  
- `sort -kr 2 data.txt` → Sort by second column in reverse order (largest first of 2nd column value)
- `sort -t , -k 3 file.csv` → Sort CSV by third column  
- `cat data.txt | sort | uniq` → Sort and remove duplicates in one pipeline  
- `sort file.txt -o sorted.txt` → Save sorted output to sorted.txt  
