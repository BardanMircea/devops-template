#!/bin/bash
# filepath: c:\Users\Wheremywagonat\Desktop\ISI\GenAI\devops-template\scripts\db-backup-restore.sh

# Exit immediately if a command exits with a non-zero status
set -e

ACTION=$1
BACKUP_FILE="db_backup_$(date +%Y%m%d%H%M%S).sql"

if [ "$ACTION" == "backup" ]; then
  echo "Backing up the database..."
  docker exec -t db pg_dump -U user devops_template > $BACKUP_FILE
  echo "Backup saved to $BACKUP_FILE"
elif [ "$ACTION" == "restore" ]; then
  echo "Restoring the database..."
  docker exec -i db psql -U user devops_template < $2
  echo "Database restored from $2"
else
  echo "Usage: $0 {backup|restore} [backup_file]"
fi