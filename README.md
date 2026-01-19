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
- 📊 **Structured Data Utilities**: Work with YAML, JSON and JSONPath using both CLI command line utilities and Python libraries.  
- 🛠️ **Helper Scripts**: Utility scripts (like `tree.py`) to visualize and manage repository structures.  

---

#### 📂 Repository Structure

```text
grokking-command-line
├── README.md                           # Project overview & roadmap
├── bash-scripting                      # 📂 Core Bash Automation
│   ├── arguments                       # Script input handling
│   │   ├── arguments.md                # Positional param ($1, $@) ref
│   │   └── log_rotation.sh             # Practical: Arg-driven log cleanup
│   ├── bash-script-debugging           # Error tracking & set -x
│   │   └── debug.md                    # Debugging flags & techniques
│   ├── bash-scripts-intro              # Getting started
│   │   └── introduction.md             # Shebangs & execution basics
│   ├── basic-math                      # Arithmetic in Shell
│   │   ├── basicmath.md                # $(( )) syntax guide
│   │   └── batch_Scheduling.sh         # Logic: Modulus for batching
│   ├── case-statement                  # Pattern matching logic
│   │   ├── case.md                     # Syntax for switch-case
│   │   └── firewall_rule.sh            # Practical: Input-based port mgmt
│   ├── exit-codes                      # Success & failure logic
│   │   ├── backup_script.sh            # Error handling in backups
│   │   └── exit-codes.md               # $? and custom exit status
│   ├── for-loops                       # Iteration techniques
│   │   ├── filearchive.sh              # Loop: Archiving file lists
│   │   ├── fileremove.sh               # Loop: Targeted file cleanup
│   │   ├── for.md                      # Syntax: Lists, arrays, globbing
│   │   └── whichfiles.sh               # Loop: File type identification
│   ├── functions                       # Code reusability
│   │   ├── functions.md                # Definition & scope ref
│   │   └── k8s_pod_health_check.sh     # Modular Kubernetes check
│   ├── if-statement                    # Conditional branching
│   │   ├── currentmonth.sh             # Logic: Date-based triggers
│   │   ├── if.md                       # Test operators [ ] vs [[ ]]
│   │   ├── program.sh                  # Multi-condition logic flow
│   │   ├── welcome.sh                  # Simple user-based greeting
│   │   └── whichdaemon.sh              # Service existence checks
│   ├── io-streams-redirect             # Redirection & Pipes
│   │   ├── io-streams-redirect.md       # Stdout/Stderr (2>&1) guide
│   │   └── sys_monitoring.sh           # Logging output to files
│   ├── real-time-scripts               # 🚀 Production Use-Cases
│   │   ├── api_call_retry.sh           # Network: Resilience logic
│   │   ├── backup_dir.sh               # Storage: Directory syncing
│   │   ├── deploy.sh                   # CI/CD: Simple deployment flow
│   │   ├── deploy_env_validate.sh      # Pre-flight environment checks
│   │   ├── disk_usage_monitoring.sh    # Ops: Low space alerting
│   │   ├── k8s_pod_status.sh           # K8s: Quick cluster sanity
│   │   ├── log_archiver.sh             # Maintenance: Log compression
│   │   ├── os_package_installer.sh     # Distro: apt/yum abstraction
│   │   ├── pkg_installer.sh            # Setup: Dependency installer
│   │   ├── readme.md                   # Script index & usage
│   │   ├── server_mgmt.sh              # Admin: Multi-tool dashboard
│   │   ├── service_status.sh           # Systemd: Service health check
│   │   └── sys_overview.sh             # Dashboard: CPU/RAM/Uptime
│   ├── regex                           # Pattern processing
│   │   ├── log_monitoring_getip.sh     # Extracting IPs from logs
│   │   └── regex.md                    # Grep/Sed pattern guide
│   ├── variables                       # Data storage
│   │   └── variables.md                # Env vs Local scope
│   └── while-loops                     # Continuous execution
│       ├── filecheck.sh                # Wait logic for file appearance
│       ├── techstack.sh                # Menu-driven infinite loop
│       └── while.md                    # Reading files line-by-line
├── helperScripts                       # 🛠️ Internal Tools
│   └── tree.py                         # Generates repo visualization
├── linux-cmdline-essentials            # 🐧 Core Linux Skills
│   ├── data-stream-text-edit           # Non-interactive editing
│   │   ├── datastream.md               # Stream processing concepts
│   │   └── vi.md                       # Essential Vim shortcuts
│   ├── file-ops                        # File system navigation
│   │   ├── find.md                     # Deep search by time/size
│   │   ├── tar.md                      # Compression & expansion
│   │   └── tree.md                     # Structure visualization
│   ├── networking                      # Connectivity & DNS
│   │   ├── curl.md                     # API & web requests
│   │   ├── dig.md                      # DNS lookup & records
│   │   ├── hostname.md                 # System identity mgmt
│   │   ├── ip.md                       # Interface & routing (ip addr)
│   │   ├── ping.md                     # ICMP connectivity check
│   │   ├── ss.md                       # Socket & port statistics
│   │   └── wget.md                     # CLI file downloading
│   ├── process-mgmt                    # System performance
│   │   ├── pgrep.md                    # Finding PIDs by name
│   │   ├── ps.md                       # Process snapshots
│   │   └── pstree.md                   # Parent/Child hierarchy
│   ├── resource-monitoring             # Hardware utilization
│   │   ├── df.md                       # Partition space usage
│   │   ├── du.md                       # Directory size breakdown
│   │   └── top.md                      # Real-time task manager
│   ├── scheduling                      # Automation timers
│   │   ├── cron.md                     # Crontab syntax & setup
│   │   └── watch.md                    # Command execution repeating
│   ├── shellenv-basics                 # Environment customization
│   │   ├── alias.md                    # Command shortcuts
│   │   └── path.md                     # Executable search paths
│   └── text-manipulation               # ✂️ Data Slicing Tools
│       ├── awk.md                      # Column-based processing
│       ├── grep.md                     # Line-based searching
│       ├── sed.md                      # Find and replace logic
│       ├── sort.md                     # Data ordering
│       ├── tee.md                      # Split output to file & screen
│       └── uniq.md                     # Duplicate removal
├── python-scripting                    # 🐍 DevOps with Python
│   ├── data-types                      # Strings, Lists, Dicts
│   │   └── data-types.md               # Python dynamic typing ref
│   ├── env-setup                       # Virtualenvs & Pip
│   │   └── env-setup.md                # Python environment best practices
│   ├── exception-handling              # Error resilience
│   │   ├── config_loader.py            # Try-except for file loading
│   │   └── exception-handling.md       # Handling runtime crashes
│   ├── for-loops                       # Collection iteration
│   │   ├── for.md                      # Range vs List iteration
│   │   └── service_status.py           # Checking service lists
│   ├── functions                       # Logic encapsulation
│   │   └── functions.md                # def/return and args guide
│   ├── if-statement                    # Logic control
│   │   ├── healthcheck.py              # Boolean-based health logic
│   │   ├── if.md                       # Comparison operators ref
│   │   └── sysload.py                  # Threshold-based alerting
│   ├── match-statement                 # Structural Pattern Matching
│   │   ├── deploy_env.py               # Modern Switch-Case (Py 3.10+)
│   │   └── match.md                    # Syntax guide for Match/Case
│   ├── methods                         # String/List operations
│   │   ├── methods.md                  # .strip(), .append(), etc.
│   │   └── service_manager.py          # Class-based service logic
│   ├── modules                         # Importing code
│   │   ├── custom_utiliy.py            # Creating reusable utilities
│   │   └── modules.md                  # import/from syntax
│   ├── python-scripts-intro            # Scripting basics
│   │   └── introduction.md             # Interpreter & Indentation
│   ├── real-time-scripts               # 📦 DevOps Libraries (Standard & Ext)
│   │   └── modules-for-devops          # Module-specific deep dives
│   │       ├── crontab                 # Managing OS jobs
│   │       ├── json                    # Parsing API responses
│   │       ├── logging                 # Structured app logs
│   │       ├── os                      # Path & directory mgmt
│   │       ├── pandas                  # CSV/Log data analysis
│   │       ├── platform                # Identifying CPU/Arch
│   │       ├── psutil                  # Advanced resource stats
│   │       ├── pyyaml                  # Parsing K8s/Ansible YAML
│   │       ├── re                      # RegEx pattern matching
│   │       ├── shutil                  # High-level file operations
│   │       ├── smtplib                 # Sending email alerts
│   │       ├── subprocess              # Executing Shell commands
│   │       └── sys                     # Script CLI arguments
│   ├── regex                           # Python 're' module
│   │   ├── log_scanner.py              # Parsing patterns from text
│   │   └── regex.md                    # Regex methods (search/match)
│   ├── variables                       # Data assignment
│   │   ├── demovar.py                  # Script: Variable demos
│   │   └── variables.md                # Naming & Type guide
│   └── while-loops                     # Conditions & Retries
│       ├── retry.py                    # Backoff logic for API calls
│       └── while.md                    # Indefinite execution loops
└── structured-data-utils               # 🏗️ Data Formats
    └── yaml                            # YAML & JSON handling
        ├── json.md                     # JSON syntax & structure
        ├── jsonpath.md                 # Querying JSON fields
        └── yaml.md                     # YAML for Config Management
```