# Write a Python script to parse command-line arguments in DevOps tools, such as configuring a deployment script with flags. Usage: Run the script with `python arg_parser.py --env production` to set and print the environment.

import sys

# Print all command-line arguments
print(f"Script name: {sys.argv[0]}")
print(f"Arguments: {sys.argv[1:]}")

# Simple argument parsing (for demonstration; use argparse for complex cases)
env = 'development'  # Default value
if len(sys.argv) > 1 and sys.argv[1] == '--env':
    if len(sys.argv) > 2:
        env = sys.argv[2]
    else:
        print("Error: --env requires a value")
        sys.exit(1)  # Exit with error code

print(f"Deployment environment set to: {env}")

# Example: Read from stdin (e.g., piped input in pipelines)
input_data = sys.stdin.read().strip() if not sys.stdin.isatty() else ""
if input_data:
    print(f"Received input from stdin: {input_data}")