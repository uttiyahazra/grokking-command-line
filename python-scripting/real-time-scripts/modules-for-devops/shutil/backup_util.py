# Write a Python script to handle file backups in DevOps, such as copying log directories or creating archives for storage. Usage: Run the script with `python backup_util.py` to copy a sample directory and create a tar archive.

import shutil
import os

# Source and destination for copying a directory
source_dir = 'logs'  # Assume this directory exists
dest_dir = 'logs_backup'

# Copy the entire directory tree
if os.path.exists(source_dir):
    shutil.copytree(source_dir, dest_dir)  # Copies recursively, including metadata
    print(f"Copied {source_dir} to {dest_dir}")
else:
    print(f"Source directory {source_dir} does not exist")

# Create a tar archive of the backup
archive_name = 'logs_backup.tar.gz'
shutil.make_archive(archive_name[:-7], 'gztar', dest_dir)  # Creates a gzipped tar archive
print(f"Created archive: {archive_name}")

# Clean up: Remove the backup directory (comment out if not needed)
# shutil.rmtree(dest_dir)