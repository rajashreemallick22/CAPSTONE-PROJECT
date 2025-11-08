#!/usr/bin/env bash
# LOG_MONITOR.sh - scan logs and alert for issues
set -euo pipefail

source "$(dirname "$0")/CONFIG.sh"

PATTERNS=("ERROR" "CRITICAL" "Failed password" "segfault" "panic")
TMP_OUTPUT="$(mktemp)"
trap 'rm -f "$TMP_OUTPUT"' EXIT

echo "[$(date '+%F %T')] Scanning logs: $MONITOR_LOGS" | tee -a "$LOG_FILE"

for logfile in $MONITOR_LOGS; do
  if [[ -f "$logfile" ]]; then
    tail -n 200 "$logfile" >> "$TMP_OUTPUT"
  fi
done

ALERTS_FOUND=0
for pattern in "${PATTERNS[@]}"; do
  if grep -Eiq "$pattern" "$TMP_OUTPUT"; then
    echo "Found pattern: $pattern" | tee -a "$LOG_FILE"
    ALERTS_FOUND=1
  fi
done

if [[ $ALERTS_FOUND -eq 1 ]]; then
  echo "[$(date '+%F %T')] ALERT: suspicious log entries found" | tee -a "$LOG_FILE"
else
  echo "[$(date '+%F %T')] No suspicious activity found." | tee -a "$LOG_FILE"
fi
