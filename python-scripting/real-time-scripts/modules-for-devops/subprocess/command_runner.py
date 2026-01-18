# Write a Python script to execute shell commands in a DevOps automation workflow, such as running a git pull or deploying an application. Usage: Run the script with `python command_runner.py` to execute a sample command and capture its output.

import subprocess

# Define the command to run (e.g., listing files in the current directory)
command = ['ls', '-l']  # Use list to avoid shell injection risks

# Run the command and capture output
try:
    result = subprocess.run(command, capture_output=True, text=True, check=True)  # check=True raises error on failure
    print("Command output:")
    print(result.stdout)
except subprocess.CalledProcessError as e:
    print(f"Command failed with error: {e.stderr}")

# Example: Run a command with input (e.g., for interactive tools, but here simulating)
echo_command = ['echo', 'Hello, DevOps!']
subprocess.run(echo_command)