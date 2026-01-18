# 📚 Grokking the Command Line

> ⚡ *Your gateway to mastering the shell, automating workflows, and taming structured data.*

---
## 💡 Quote of Inspiration 

*“Intelligence is the ability to avoid doing work, yet getting the work done.”*  
— Linus Torvalds

This repository embodies that principle: mastering the command line to automate, simplify, and achieve more with less effort.

---

### 🌟 What is this repository?
**Grokking Command Line** is a **curated collection** of:

- 🖥️ **Linux command‑line utilities** — the everyday tools every power user should know  
- 🔄 **Bash scripting demos** — practical scripts for loops, conditionals, arguments, and automation  
- 🐍 **Python scripting for DevOps** — control structures, modules, and real‑time automation examples  
- 📊 **Structured data manipulation** — YAML & JSON with `jq`, `yq`, and Python libraries  

---

### 🎯 Why it matters
This repository is designed as a **hands‑on learning playground** for anyone who wants to:

- 🏗️ **Master the command line** — build fluency with foundational commands  
- ⚙️ **Automate workflows in shell & Python** — reduce repetitive tasks with scripts  
- 📑 **Manipulate structured data formats** — YAML & JSON for DevOps, Kubernetes, and beyond  
- 📈 **Monitor and manage systems programmatically** — using Python modules like `psutil`, `logging`, and `subprocess`  

---

#### ✨ Highlights

- 🖥️ **Bash Scripting**: Learn loops, conditionals, arguments, variables, exit codes, and more through practical scripts.  
- ⚙️ **Core Linux Commands**: Explore essential tools for file operations, networking, process management, resource monitoring, scheduling, and text manipulation.  
- 🐍 **Python Scripting**: Discover Python constructs (loops, conditionals, functions, modules) and DevOps‑oriented libraries (`os`, `psutil`, `logging`, `subprocess`, `smtplib`, `shutil`, `pandas`, `pyyaml`, `re`, `platform`, `crontab`).  
- 📊 **Structured Data Utilities**: Work with YAML, JSON, and JSONPath using both CLI tools (`jq`, `yq`) and Python libraries.  
- 🛠️ **Helper Scripts**: Utility scripts (like `tree.py`) to visualize and manage repository structures.  

---

#### 📂 Repository Structure

```text
grokking-command-line
├── bash-scripting/              # Bash demos: loops, conditionals, cron, functions, real-time scripts
├── linux-cmdline-essentials/    # Core Linux utilities: networking, file ops, process mgmt, resource monitoring
├── python-scripting/            # Python constructs & DevOps modules
│   ├── data-types/              # Python primitives & collections
│   ├── variables/               # Variable scope & usage
│   ├── if-statement/            # Conditional checks (healthcheck.py, sysload.py)
│   ├── for-loops/               # Iteration (service_status.py)
│   ├── while-loops/             # Retry logic (retry.py)
│   ├── match-statement/         # Environment branching (deploy_env.py)
│   ├── functions/               # Function definitions & usage
│   ├── methods/                 # Class methods (service_manager.py)
│   ├── modules/                 # Custom modules & imports
│   ├── exception-handling/      # Safe config loading & error handling
│   ├── regex/                   # Log scanning with regex
│   ├── real-time-scripts/       # DevOps modules in action:
│   │   └── modules-for-devops/
│   │       ├── os/              # File ops, system checks
│   │       ├── psutil/          # Resource monitoring
│   │       ├── logging/         # Structured logging
│   │       ├── subprocess/      # Command execution
│   │       ├── smtplib/         # Email alerts
│   │       ├── shutil/          # Backups & archiving
│   │       ├── pandas/          # Log analysis & reporting
│   │       ├── pyyaml/          # YAML parsing & config mgmt
│   │       ├── json/            # JSON parsing & config mgmt
│   │       ├── re/              # Regex log parsing
│   │       ├── platform/        # System introspection
│   │       ├── crontab/         # Job scheduling
│   │       └── sys/             # CLI args, exit codes, runtime info
├── structured-data-utils/       # YAML & JSON utilities (json.md, yaml.md, jsonpath.md)
├── helperScripts/               # Utility helpers (tree.py)
└── README.md
```