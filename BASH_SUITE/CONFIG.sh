#!/usr/bin/env bash
# config.sh - configuration for Bash Scripting Suite

# ===== USER CONFIG =====
# Directory to back up (change to a directory you actually want backed up)
SOURCE_DIR="$HOME/Documents"

# Where backups are stored
BACKUP_DIR="$HOME/CAPSTONE_BACKUPS"

# Number of backups to keep (rotate)
KEEP_BACKUPS=7

# Log file used by scripts
LOG_FILE="$HOME/CAPSTONE/BASH_SUITE/logs/maintenance.log"

# Log files to monitor (space-separated)
MONITOR_LOGS="/var/log/syslog /var/log/auth.log"

# Email for alerts (optional; script will fallback to console if empty)
ALERT_EMAIL=""

# Create missing dirs
mkdir -p "$(dirname "$LOG_FILE")"
mkdir -p "$BACKUP_DIR"
