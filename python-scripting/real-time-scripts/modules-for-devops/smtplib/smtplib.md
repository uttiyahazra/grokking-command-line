# 📧 Python `smtplib` Module — DevOps Handy Snippets

> *"Automated email alerts keep DevOps teams informed; `smtplib` allows you to send notifications, reports, and logs directly from your Python automation scripts."*

---

## 🔑 Basic Setup

```python
import smtplib
from email.mime.text import MIMEText

# Common SMTP server details
SMTP_SERVER = "smtp.example.com"
SMTP_PORT = 587  # Standard port for STARTTLS
USERNAME = "alert@example.com"
PASSWORD = "yourpassword"
```



---

## 📂 Send Plain Text Email

The most common use case: sending a quick notification after a script finishes or a cron job completes.

```python
msg = MIMEText("Deployment completed successfully on the production cluster.")
msg["Subject"] = "🚀 Deployment Status: SUCCESS"
msg["From"] = USERNAME
msg["To"] = "team@example.com"

with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
    server.starttls()  # Upgrade the connection to secure TLS
    server.login(USERNAME, PASSWORD)
    server.send_message(msg)

print("✅ Alert email sent successfully.")
```

---

## 🛠️ Send HTML Email

Use HTML to send formatted reports, including bold status updates, tables, or links to monitoring dashboards.

```python
html = """\
<html>
  <body style="font-family: sans-serif;">
    <h3 style="color: #2e7d32;">Deployment Report</h3>
    <p>Status: <b>SUCCESS</b></p>
    <p>Check the <a href="[https://grafana.example.com](https://grafana.example.com)">Dashboard</a> for metrics.</p>
  </body>
</html>
"""

msg = MIMEText(html, "html")
msg["Subject"] = "📊 Deployment Report"
msg["From"] = USERNAME
msg["To"] = "team@example.com"

with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
    server.starttls()
    server.login(USERNAME, PASSWORD)
    server.send_message(msg)
```

---

## 🔗 Multiple Recipients

To broadcast alerts to an entire team or multiple departments, join the recipient list into a single string for the header.

```python
recipients = ["devops@example.com", "qa@example.com", "manager@example.com"]

msg = MIMEText("Pipeline failed at stage: build. Critical error in unit tests.")
msg["Subject"] = "⚠️ Pipeline Failure Alert"
msg["From"] = USERNAME
msg["To"] = ", ".join(recipients) # Formats list for the "To" header

with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
    server.starttls()
    server.login(USERNAME, PASSWORD)
    server.send_message(msg)
```

---

## 📈 Attaching Log Files

In DevOps, context is everything. Attaching the relevant `error.log` helps the on-call engineer troubleshoot immediately.



```python
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders

msg = MIMEMultipart()
msg["Subject"] = "📑 Critical Error Logs"
msg["From"] = USERNAME
msg["To"] = "ops@example.com"

# 1. Attach the email body
msg.attach(MIMEText("An incident occurred. Please find the attached error logs."))

# 2. Attach the file
log_path = "/var/log/app/error.log"
with open(log_path, "rb") as f:
    part = MIMEBase("application", "octet-stream")
    part.set_payload(f.read())
    encoders.encode_base64(part)
    part.add_header("Content-Disposition", f"attachment; filename=error.log")
    msg.attach(part)

with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
    server.starttls()
    server.login(USERNAME, PASSWORD)
    server.send_message(msg)
```

---

## 🧹 Error Handling

Network issues or expired credentials can cause alert scripts to fail. Always wrap your SMTP logic to ensure your main script continues even if the email fails.

```python
try:
    with smtplib.SMTP(SMTP_SERVER, SMTP_PORT) as server:
        server.starttls()
        server.login(USERNAME, PASSWORD)
        server.sendmail(USERNAME, "ops@example.com", "Subject: Test\n\nTest Message")
except smtplib.SMTPAuthenticationError:
    print("❌ Auth Failed: Check username/password.")
except smtplib.SMTPException as e:
    print(f"❌ SMTP Error: {e}")
```

---

## 🧠 Critical Nuances

* **`starttls()`**: This is vital. Without it, your password is sent in plain text across the network.
* **Context Managers**: Using `with smtplib.SMTP(...)` ensures the connection is closed (`QUIT`) automatically, even if an error occurs.
* **App Passwords**: If using Gmail or Outlook with 2FA, you must generate a specific "App Password" rather than using your main account password.
* **MIME Structure**: For simple text, `MIMEText` is enough. For anything involving attachments or both HTML and Text versions, you must use `MIMEMultipart`.

---

## 🎯 Quick Mnemonics
* **`SMTP()`** → Connect to the server.
* **`starttls()`** → Secure the connection.
* **`login()`** → Authenticate yourself.
* **`send_message()`** → The preferred way to send modern MIME objects.
* **`MIMEMultipart`** → The container for emails with attachments.

