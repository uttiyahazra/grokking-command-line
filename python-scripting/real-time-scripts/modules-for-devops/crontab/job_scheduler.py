# Write a Python script to schedule cron jobs in DevOps for automated tasks, such as daily backups. Usage: Install python-crontab via pip if needed, then run `python job_scheduler.py` to add a sample job to your crontab.

from crontab import CronTab

# Access the current user's crontab
my_cron = CronTab(user=True)  # Use user=True for current user

# Create a new job (e.g., run a backup script every day at 2 AM)
job = my_cron.new(command='python /path/to/backup.py', comment='Daily backup')
job.setall('0 2 * * *')  # Cron syntax: minute hour day month weekday

# Add the job to crontab
my_cron.write()  # Persists changes
print("Added daily backup job")

# List all jobs
for existing_job in my_cron:
    print(existing_job)

# Remove a job by comment (for cleanup)
# my_cron.remove_all(comment='Daily backup')
# my_cron.write()