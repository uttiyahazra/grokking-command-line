# Write a Python script to parse log files using regular expressions in DevOps, such as extracting error messages from server logs. Usage: Assume a 'server.log' file; run `python log_parser.py` to search and print matches.

import re

# Sample log content (could read from file)
log_content = """
2023-01-01 12:00: ERROR - Failed to connect to DB
2023-01-02 13:00: INFO - Deployment successful
2023-01-03 14:00: ERROR - Timeout exceeded
"""

# Regex pattern to match errors (date time level - message)
error_pattern = re.compile(r'(\d{4}-\d{2}-\d{2} \d{2}:\d{2}): ERROR - (.*)')

# Find all matches
errors = error_pattern.findall(log_content)
if errors:
    print("Found Errors:")
    for date, message in errors:
        print(f"{date}: {message}")
else:
    print("No errors found")

# Example: Replace sensitive info (e.g., mask IPs)
ip_pattern = re.compile(r'\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b')
masked_log = ip_pattern.sub('xxx.xxx.xxx.xxx', log_content)
print("Masked Log:")
print(masked_log)