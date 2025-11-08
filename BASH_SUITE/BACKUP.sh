#!/usr/bin/env bash
# backup.sh - create dated tar.gz backups (with rotation)
set -euo pipefail

source "$(dirname "$0")/CONFIG.sh"

TIMESTAMP="$(date +%F_%H%M%S)"
HOSTNAME="$(hostname -s)"
BACKUP_NAME="${HOSTNAME}_${TIMESTAMP}.tar.gz"
TARGET="${BACKUP_DIR%/}/$BACKUP_NAME"

echo "[$(date '+%F %T')] Starting backup of $SOURCE_DIR -> $TARGET" | tee -a "$LOG_FILE"

# Dry-run mode if environment variable DRY_RUN=1 is set
if [[ "${DRY_RUN:-0}" -eq 1 ]]; then
  echo "Dry-run: would create archive $TARGET" | tee -a "$LOG_FILE"
  exit 0
fi

# Create the archive (preserve permissions)
tar -cpzf "$TARGET" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Verify file created
if [[ -f "$TARGET" ]]; then
  echo "[$(date '+%F %T')] Backup saved: $TARGET" | tee -a "$LOG_FILE"
else
  echo "[$(date '+%F %T')] ERROR: backup failed" | tee -a "$LOG_FILE" >&2
  exit 1
fi

# Rotate: keep latest $KEEP_BACKUPS files
cd "$BACKUP_DIR"
# List matching files sorted by ctime, keep the latest $KEEP_BACKUPS
FILES_TO_DELETE=($(ls -1t | grep -E "^${HOSTNAME}_" | tail -n +$((KEEP_BACKUPS+1)) || true))
if (( ${#FILES_TO_DELETE[@]} )); then
  for f in "${FILES_TO_DELETE[@]}"; do
    rm -f -- "$f"
    echo "[$(date '+%F %T')] Deleted old backup $f" | tee -a "$LOG_FILE"
  done
fi
