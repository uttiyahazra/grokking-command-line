# Write a Python script to set up logging in DevOps applications for debugging and monitoring. Usage: Run `python app_logger.py` to generate log messages at different levels and write to a file.

import logging

# Configure logging
logging.basicConfig(
    filename='app.log',  # Log to file
    level=logging.DEBUG,  # Set level to DEBUG for all messages
    format='%(asctime)s - %(levelname)s - %(message)s'  # Custom format
)

# Create a logger
logger = logging.getLogger('DevOpsApp')

# Log messages at different levels
logger.debug("Debug: Detailed info for troubleshooting")
logger.info("Info: Deployment started")
logger.warning("Warning: High memory usage detected")
logger.error("Error: Deployment failed")
logger.critical("Critical: System outage")

print("Check app.log for logged messages")