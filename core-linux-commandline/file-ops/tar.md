## Breakdown of Components

### [starting-input]
The file(s) or directory to archive or extract.  
**Example:** `tar -cvf archive.tar folder/` → create an archive containing the contents of `folder/`.

---

### [options]
Control archiving, compression, extraction, and output.

- `-c` → create a new archive  
- `-x` → extract files from an archive  
- `-v` → verbose mode (list files as they are processed)  
- `-f` → specify archive filename (must be last option before filename)  
- `-z` → use gzip compression  
- `-j` → use bzip2 compression  
- `-J` → use xz compression  
- `-t` → list contents of an archive  
- `--delete` → remove files from an archive (GNU tar)  
- `--wildcards` → allow wildcard patterns when extracting/listing  

---

### [tests]
Conditions or checks for archives.

- `tar -tvf archive.tar` → list contents of archive.tar  
- `tar -tzvf archive.tar.gz` → list contents of compressed archive  
- `tar -tf archive.tar file.txt` → check if file.txt exists inside archive  
- `tar -tvf archive.tar | grep keyword` → search for specific file in archive  

---

### [actions]
What to do with archives.

- Create archive → `tar -cvf archive.tar folder/`  
- Extract archive → `tar -xvf archive.tar`  
- Compress archive → `tar -czvf archive.tar.gz folder/`  
- Extract compressed archive → `tar -xzvf archive.tar.gz`  
- Use different compression → `tar -cJvf archive.tar.xz folder/`  
- Append files → `tar -rvf archive.tar newfile.txt`  
- Delete files → `tar --delete -f archive.tar unwanted.txt`  
- List contents → `tar -tvf archive.tar`  

---

## Example Usage

- `tar -cvf archive.tar folder/` → Create archive with the contents of `folder/`  
- `tar -xvf archive.tar` → Extract archive  
- `tar -czvf archive.tar.gz folder/` → Create compressed archive using gzip  
- `tar -xzvf archive.tar.gz` → Extract compressed archive using gzip  
- `tar -tvf archive.tar` → List contents of archive.tar  
- `tar -tzvf archive.tar.gz` → List contents of compressed archive.tar.gz  
- `tar -tf archive.tar file.txt` → Check if file.txt exists inside archive  
- `tar -tvf archive.tar | grep config` → Search for "config" file inside archive  
