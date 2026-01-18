# Write a Python script to send email alerts in DevOps, such as notifying on build failures. Usage: Configure your SMTP details, then run `python email_alerter.py` to send a test email. Note: Use secure connections and avoid hardcoding credentials in production.

import smtplib
from email.mime.text import MIMEText

# SMTP server details (example for Gmail; use app password)
smtp_server = 'smtp.gmail.com'
smtp_port = 587
sender_email = 'your_email@gmail.com'
receiver_email = 'recipient@example.com'
password = 'your_app_password'

# Create message
msg = MIMEText('Alert: Deployment failed on prod environment.')
msg['Subject'] = 'DevOps Alert'
msg['From'] = sender_email
msg['To'] = receiver_email

# Send email
try:
    with smtplib.SMTP(smtp_server, smtp_port) as server:
        server.starttls()  # Secure connection
        server.login(sender_email, password)
        server.send_message(msg)
    print("Email sent successfully")
except Exception as e:
    print(f"Failed to send email: {e}")