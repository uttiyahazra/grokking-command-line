## Breakdown of Components

### [starting-alias]
An alias is a shortcut for a longer command or sequence of commands.  
**Example:** `alias ll='ls -l'` → creates `ll` as a shortcut for `ls -l`.

---

### [options]
Control alias creation, listing, and removal.

- `alias` → list all current aliases  
- `alias name='command'` → create a new alias  
- `unalias name` → remove a specific alias  
- `unalias -a` → remove all aliases  
- `bashrc` / `zshrc` → configuration files where aliases can be made persistent  

---

### [tests]
Conditions or checks for aliases.

- `alias` → check what aliases are currently defined  
- `type ll` → verify what command `ll` resolves to  
- `unalias ll` → test removing alias `ll`  
- `alias grep='grep --color=auto'` → test enhanced grep output  

---

### [actions]
What to do with aliases.

- Create → `alias gs='git status'`  
- Remove → `unalias gs`  
- Persist → add alias definition to `~/.bashrc` or `~/.zshrc`  
- Reload → `source ~/.bashrc` to apply changes immediately  
- Override → redefine an alias to change its behavior  

---

## Example Usage

- `alias ll='ls -l'` → Create alias `ll` for `ls -l`  
- `alias la='ls -A'` → Create alias `la` for listing all files except `.` and `..`  
- `alias grep='grep --color=auto'` → Highlight matches in grep output  
- `alias gs='git status'` → Shortcut for checking Git status  
- `alias update='sudo apt update && sudo apt upgrade'` → Shortcut for system update  
- `unalias ll` → Remove alias `ll`  
- `unalias -a` → Remove all aliases  
- `alias` → List all currently defined aliases  
- `type ll` → Show what command `ll` resolves to (alias or binary)  
- `echo "alias ll='ls -l'" >> ~/.bashrc` → Make alias persistent across sessions  
- `source ~/.bashrc` → Reload Bash configuration to apply new aliases  
