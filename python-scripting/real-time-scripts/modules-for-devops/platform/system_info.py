# Write a Python script to gather system information for DevOps compatibility checks, such as determining the OS type or processor architecture before deployments. Usage: Run the script with `python system_info.py` to print detailed system info.

import platform

# Get the operating system name (e.g., 'Linux', 'Windows')
os_name = platform.system()
print(f"Operating System: {os_name}")

# Get the machine architecture (e.g., 'x86_64')
arch = platform.machine()
print(f"Architecture: {arch}")

# Get detailed OS release info
release = platform.release()
print(f"OS Release: {release}")

# Get Python version for build consistency
python_version = platform.python_version()
print(f"Python Version: {python_version}")

# Compile all into a summary
summary = platform.uname()  # Returns a named tuple with system details
print(f"System Summary: {summary}")