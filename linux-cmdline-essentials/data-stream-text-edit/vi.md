## Breakdown of Components

### [starting-input]
The file to open or edit.  
**Example:** `vi file.txt` → open file.txt in the vi editor.

---

### [options]
Control how `vi` starts or behaves.

- `vi file.txt` → open file.txt for editing  
- `vi +n file.txt` → open file.txt and place cursor at line *n*  
- `vi + file.txt` → open file.txt and place cursor at the last line  
- `vi -R file.txt` → open file.txt in read‑only mode  
- `vi -c command file.txt` → execute a command after opening file  

---

### [tests]
Conditions or modes inside `vi`.

- **Normal mode** → default mode for navigation and commands  
- **Insert mode** → for text entry (`i`, `a`, `o` to enter)  
- **Command‑line mode** → for saving, quitting, searching (`:` prefix)  
- **Visual mode** (in `vim`, extended vi) → select text regions  

---

### [actions]
What to do inside `vi`.

- `i` → enter insert mode before cursor  
- `a` → enter insert mode after cursor  
- `o` → open new line below and enter insert mode  
- `x` → delete character under cursor  
- `dd` → delete current line  
- `yy` → yank (copy) current line  
- `p` → paste after cursor  
- `u` → undo last change  
- `/pattern` → search forward for pattern  
- `?pattern` → search backward for pattern  
- `:w` → save file  
- `:q` → quit editor  
- `:wq` → save and quit  
- `:q!` → quit without saving  

---

## Example Usage

### Basic
- `vi file.txt` → Open file.txt in vi editor  
- `vi +10 file.txt` → Open file.txt and jump to line 10  
- `vi -R file.txt` → Open file.txt in read‑only mode  
- `i` → Enter insert mode at cursor position  
- `dd` → Delete current line  
- `yy` → Yank (copy) current line  
- `p` → Paste after cursor  
- `:wq` → Save and quit  

---

## Advanced Usages for Speed & Lucidity

### Navigation
- `w` → jump forward one word  
- `b` → jump backward one word  
- `0` → move to beginning of line  
- `^` → move to first non‑blank character of line  
- `$` → move to end of line  
- `Ctrl‑d` → scroll down half a screen  
- `Ctrl‑u` → scroll up half a screen  
- `gg` → go to beginning of file  
- `G` → go to end of file  
- `nG` → go to line number *n*  

### Editing Efficiency
- `cw` → change word (delete word and enter insert mode)  
- `c$` → change to end of line  
- `C` → change entire line from cursor onward  
- `dw` → delete word  
- `d$` → delete to end of line  
- `D` → delete entire line from cursor onward  
- `xp` → transpose two characters (delete then paste)  
- `J` → join current line with next line  

### Search & Replace
- `:%s/foo/bar/g` → replace all occurrences of "foo" with "bar" in entire file  
- `:10,20s/foo/bar/g` → replace "foo" with "bar" between lines 10 and 20  
- `:%s/foo/bar/gc` → replace all with confirmation for each occurrence  
- `n` → repeat last search forward  
- `N` → repeat last search backward  


### Visual Mode (in vim)
- `v` → start visual selection (characterwise)  
- `V` → start visual selection (linewise)  
- `Ctrl‑v` → start blockwise visual selection  
- `y` → yank selected text  
- `d` → delete selected text  
- `>` → indent selected text  
- `<` → unindent selected text  

### Productivity Tricks
- `:split` → split window horizontally  
- `:vsplit` → split window vertically  
- `:tabnew file.txt` → open file.txt in new tab  
- `:buffers` → list open buffers  
- `:bN` → switch to buffer N  
- `:set number` → show line numbers  
- `:set relativenumber` → show relative line numbers (speedy navigation)  

---

