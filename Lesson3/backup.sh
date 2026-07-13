#!/bin/bash
# aws-s3-backup.sh — Automated S3 backup with logging

# 1. Safety First (Month 1 pattern)
set -euo pipefail

# 2. Configuration
# TODO for students: Change BUCKET to your actual AWS S3 bucket name
# TODO for students: Change PROFILE if you don't use a named profile called 'devops'
readonly PROFILE="devops"
readonly SOURCE_DIR="$HOME/devops-bootcamp"
readonly BUCKET="s3://fernwood-backups"
readonly TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
readonly LOG_FILE="$HOME/logs/backup_${TIMESTAMP}.log"
readonly DEST="${BUCKET}/backups/${TIMESTAMP}/"

# 3. Logging function (Month 1 pattern)
log() {
echo "[$(date '+%H:%M:%S')] $*" | tee -a "${LOG_FILE}"
}

# 4. Error handler (Month 1 pattern)
trap 'log "ERROR: Script failed at line ${LINENO}"' ERR

# 5. Main Execution
# Ensure the local log and source directories exist before we start
mkdir -p "$(dirname "${LOG_FILE}")"
mkdir -p "${SOURCE_DIR}"

log "Starting backup of ${SOURCE_DIR} -> ${DEST}"

# 6. The Cloud Command (Month 2 pattern)
# Uses sync to only copy new/modified files, passing the profile for auth
aws s3 sync "${SOURCE_DIR}" "${DEST}" --profile "${PROFILE}"

log "Backup completed successfully!"

crontab -e
# Run backup every night at 2:00 AM:
0 2 * * * /bin/bash ~/scripts/aws-s3-backup.sh