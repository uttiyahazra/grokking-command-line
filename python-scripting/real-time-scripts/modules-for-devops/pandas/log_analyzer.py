# Write a Python script to analyze log data in DevOps using pandas, such as reading CSV logs and computing statistics. Usage: Assume a 'logs.csv' file exists with columns like 'timestamp,error_code'; run `python log_analyzer.py` to process it.

import pandas as pd

# Load log data from CSV
log_file = 'logs.csv'
if pd.io.common.file_exists(log_file):  # Check if file exists
    df = pd.read_csv(log_file)  # Reads into DataFrame
else:
    # Sample data if file missing
    data = {'timestamp': ['2023-01-01', '2023-01-02'], 'error_code': [404, 500]}
    df = pd.DataFrame(data)
    df.to_csv(log_file, index=False)
    print(f"Created sample {log_file}")

# Basic analysis: Count error codes
error_counts = df['error_code'].value_counts()
print("Error Code Counts:")
print(error_counts)

# Filter errors >= 500
server_errors = df[df['error_code'] >= 500]
print(f"Server Errors:\n{server_errors}")

# Summary statistics
print("Log Summary:")
print(df.describe())