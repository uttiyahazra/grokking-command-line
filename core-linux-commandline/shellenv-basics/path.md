## Breakdown of Components

### [starting-variable]
`$PATH` is an environment variable that defines the list of directories the shell searches for executable commands.  
**Example:** When you type `ls`, the shell looks through directories listed in `$PATH` to find the `ls` binary.

---

### [options]
Ways to view, modify, or extend `$PATH`.

- `echo $PATH` → display current `$PATH` value  
- `export PATH=$PATH:/new/dir` → temporarily add `/new/dir` to the end of `$PATH`  
- `export PATH=/new/dir:$PATH` → temporarily add `/new/dir` to the beginning of `$PATH` (higher priority)  
- `PATH=$PATH:/new/dir` → same as above, but only for current shell session  
- Add to `~/.bashrc` or `~/.zshrc` → make changes persistent across sessions  
- `printenv PATH` → another way to display `$PATH`  

---

### [tests]
Conditions or checks for `$PATH`.

- `which command` → check where a command is located (first match in `$PATH`)  
- `type command` → show how the shell resolves a command (alias, builtin, or path)  
- `command -v command` → verify if a command exists in `$PATH`  
- `echo $PATH | tr ':' '\n'` → list directories in `$PATH` line by line  

---

### [actions]
What to do with `$PATH`.

- View → `echo $PATH`  
- Add directory → `export PATH=$PATH:/opt/bin`  
- Prepend directory → `export PATH=/opt/bin:$PATH`  
- Persist changes → add export line to `~/.bashrc` or `~/.zshrc` and reload with `source ~/.bashrc`  
- Debug → use `which`, `type`, or `command -v` to confirm executables are found correctly  
- Clean → remove duplicate or unnecessary entries for clarity  

---

## Example Usage

- `echo $PATH` → Show current `$PATH` value  
- `printenv PATH` → Display `$PATH` using `printenv`  
- `export PATH=$PATH:/usr/local/bin` → Temporarily add `/usr/local/bin` to `$PATH`  
- `export PATH=/usr/local/bin:$PATH` → Prepend `/usr/local/bin` to `$PATH` (higher priority)  
- `echo $PATH | tr ':' '\n'` → List each directory in `$PATH` on a new line  
- `which python3` → Show the location of `python3` executable in `$PATH`  
- `type ls` → Show how `ls` is resolved (builtin or binary path)  
- `command -v gcc` → Verify if `gcc` exists in `$PATH`  
- `echo "export PATH=\$PATH:/opt/bin" >> ~/.bashrc` → Persistently add `/opt/bin` to `$PATH`  
- `source ~/.bashrc` → Reload Bash configuration to apply new `$PATH` changes  
