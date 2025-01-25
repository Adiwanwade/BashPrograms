#!/bin/bash
#AUTHOR:Aditya wanwade
# Set the backup directory
BACKUP_DIR="/path/to/backup"

# before doing backup, check if the backup directory exists
# Create the backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# List of directories to backup
DIRS_TO_BACKUP=("/home/user1" "/etc" "/var/log")

# Backup each directory
for dir in "${DIRS_TO_BACKUP[@]}"; do
    filename="$(basename "$dir")_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz"
    tar -czf "$BACKUP_DIR/$filename" "$dir"
    echo "Backup of $dir completed."
done

echo "Backup process finished."