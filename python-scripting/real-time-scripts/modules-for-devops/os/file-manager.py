# Write a Python script to manage files and directories in a DevOps pipeline, such as creating backup directories, checking file existence, and accessing environment variables for configuration. Usage: Run the script with `python file_manager.py` to create a sample backup directory and print system info.

import os

# Get the current working directory
current_dir = os.getcwd()
print(f"Current working directory: {current_dir}")

# Create a backup directory if it doesn't exist
backup_dir = os.path.join(current_dir, 'backups')
if not os.path.exists(backup_dir):
    os.makedirs(backup_dir)  # Creates the directory recursively
    print(f"Created backup directory: {backup_dir}")
else:
    print(f"Backup directory already exists: {backup_dir}")

# Access an environment variable (e.g., for CI/CD config)
deploy_env = os.environ.get('DEPLOY_ENV', 'development')  # Default to 'development' if not set
print(f"Deployment environment: {deploy_env}")

# List files in the current directory
files = os.listdir(current_dir)
print(f"Files in current directory: {files}")