# 📊 Python `pandas` Module — DevOps Handy Snippets

> *"Pandas turns raw operational data into actionable insights for DevOps automation, making it the essential tool for SREs and Platform Engineers to analyze logs, metrics, and costs."*

---

## 🔑 Basic Setup

```python
import pandas as pd
```
Pandas is built on two primary structures: the **Series** (1D) and the **DataFrame** (2D table). In DevOps, we almost exclusively use the DataFrame to represent logs and metrics tables.



---

## 📂 Data Ingestion (Logs, Metrics, Configs)

Pandas can ingest almost any structured format used in CI/CD pipelines and monitoring stacks.

```python
# Load deployment history from CSV
df = pd.read_csv("deployments.csv")

# Load structured monitoring events from JSON
df = pd.read_json("events.json")

# Preview the first 5 rows
print(df.head())
```

---

## 🛠️ Filter & Query Data

Quickly isolate incidents, failed jobs, or performance bottlenecks using logical filters.



```python
# Filter failed deployments using boolean indexing
failed = df[df["status"] == "failed"]

# Use .query() for cleaner, more readable complex conditions
high_latency = df.query("latency > 200 and env == 'production'")
```

---

## 🔗 Group & Aggregate Metrics

Essential for generating daily reports or summarizing system health across various dimensions.

```python
# Count deployments by environment and outcome
summary = df.groupby("env")["status"].value_counts()

# Calculate average response time per microservice
latency_report = df.groupby("service")["latency"].mean()
```

---

## 📈 Time Series Analysis

Since logs are essentially time-stamped events, Pandas' time-series capabilities are perfect for incident post-mortems.



```python
# 1. Convert string timestamps to actual Datetime objects
df["timestamp"] = pd.to_datetime(df["timestamp"])

# 2. Resample logs into 1-minute buckets (1T) to find error spikes
errors_per_min = df[df["level"] == "ERROR"].resample("1T", on="timestamp").size()

print(errors_per_min.tail())
```

---

## 🧹 Data Cleaning & Pre-processing

Operational data is often messy. Use these to sanitize data before sending it to a dashboard.

```python
# Remove rows with missing critical data
df = df.dropna(subset=["job_id"])

# Replace null values with a standard default (e.g., 1 replica)
df["replicas"] = df["replicas"].fillna(1)

# Standardize column names for downstream tools
df = df.rename(columns={"svc": "service", "lat": "latency"})
```

---

## 📊 Exporting Results

Processed data can be fed back into S3 buckets, monitoring tools, or sent via Slack/Email.

```python
# Save summary to a CSV for audit trails
summary.to_csv("weekly_audit.csv")

# Export as JSON records for a web dashboard
latency_report.to_json("latency_metrics.json", orient="records")
```

---

## 🧠 Critical Nuances

- **Vectorization:** Avoid looping through rows with `for`. Pandas is designed to perform operations on entire columns at once (vectorized), which is much faster for large logs.
- **`pd.to_datetime`:** Always perform this step first when working with logs; otherwise, time-based sorting and resampling won't work.
- **In-place Operations:** Many methods return a *new* DataFrame. Use `df = df.method()` or `inplace=True` to save changes.
- **Memory:** For extremely large log files (multi-GB), use the `chunksize` parameter in `read_csv`.

---

## 🛠️ Demo Snippets

### Quick Deployment Audit
```python
df = pd.read_csv("deployments.csv")
success_rate = (df["status"] == "success").mean() * 100
print(f"Overall Success Rate: {success_rate:.2f}%")
```

### Incident Error Spike Detection
```python
df = pd.read_csv("app_logs.csv")
df["timestamp"] = pd.to_datetime(df["timestamp"])

# Count errors in 5-minute windows
spikes = df[df["level"] == "ERROR"].resample("5T", on="timestamp").size()
print("Top 5 Error Spikes:")
print(spikes.sort_values(ascending=False).head())
```

---

## 🎯 Quick Mnemonics
* **`read_csv` / `read_json`** → Ingest data.
* **`df.query()`** → Filter by condition.
* **`df.groupby()`** → Aggregate metrics by category.
* **`df.resample()`** → Pivot data into time buckets.
* **`df.fillna()`** → Handle missing data points.
