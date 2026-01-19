#Write a bash script to perform database backup with exit-code handling (DevOps task demo)

#!/bin/bash

DB_NAME=$1
BACKUP_FILE="/backups/${DB_NAME}_$(date +%F).sql"

# Run backup
pg_dump "$DB_NAME" > "$BACKUP_FILE"

# Check exit code of pg_dump
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
    exit 0
else
    echo "Backup failed for database: $DB_NAME"
    exit 2
fi
