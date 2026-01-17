# cron Command

---

## Breakdown of Components

### [overview]
`cron` is a time-based job scheduler in Unix/Linux systems. It runs background processes (daemons) that execute commands or scripts at specified times and intervals. Jobs are defined in configuration files called **crontabs**.

---

### [crontab files]
- **System-wide crontab:** `/etc/crontab`  
- **User-specific crontabs:** stored in `/var/spool/cron/crontabs/username`  
- **Editing crontab:** `crontab -e` opens the editor for the current user’s cron jobs.  
- **Listing crontab:** `crontab -l` shows current jobs.  
- **Removing crontab:** `crontab -r` deletes all jobs for the user.  

---

### [cron daemon]
- Runs as `crond` or `cron` service in the background.  
- Must be active for scheduled jobs to run.  
- Controlled via `systemctl` or `service`:  
  - `systemctl status cron`  
  - `systemctl start cron`  
  - `systemctl enable cron`  

---

### [cron job format]
Each line in a crontab file follows the format mentioned in below mnemonic:

## Quick Mnemonic 

👉 **M H DOM MON DOW CMD**

- **M** → Minute  
- **H** → Hour  
- **DOM** → Day of Month  
- **MON** → Month  
- **DOW** → Day of Week  
- **CMD** → Command  

---

### [special strings]
Instead of numeric fields, cron supports shortcuts:

- `@reboot` → run once at startup  
- `@yearly` or `@annually` → run once a year (`0 0 1 1 *`)  
- `@monthly` → run once a month (`0 0 1 * *`)  
- `@weekly` → run once a week (`0 0 * * 0`)  
- `@daily` → run once a day (`0 0 * * *`)  
- `@hourly` → run once an hour (`0 * * * *`)  

---

### [environment]
- Cron jobs run with a minimal environment.  
- `$PATH` may be limited (often `/usr/bin:/bin`).  
- Always use absolute paths for commands and scripts.  
- Redirect output to files if needed, since cron mails output by default (requires MTA).  

---

## Example Usage

- `crontab -e` → edit current user’s cron jobs  
- `crontab -l` → list current user’s cron jobs  
- `crontab -r` → remove all cron jobs for current user  
- `systemctl status cron` → check if cron daemon is running  
- `echo "0 5 * * * /home/user/backup.sh" | crontab -` → schedule a backup script daily at 5 AM  
- `@reboot /home/user/startup.sh` → run a script once at system startup  
- `*/10 * * * * /home/user/check.sh` → run every 10 minutes  
- `0 */2 * * * /home/user/script.sh` → run every 2 hours  

---

## Common Pitfalls

- Forgetting to use absolute paths (e.g., `/usr/bin/python3` instead of `python3`).  
- Cron jobs failing silently because no MTA is installed (output discarded).  
- Environment variables not set — define them explicitly in the script or crontab.  
- Permissions: ensure the script is executable and accessible to the cron user.  

---
