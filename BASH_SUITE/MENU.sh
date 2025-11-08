#!/usr/bin/env bash
# MENU.sh - interactive maintenance suite
set -euo pipefail

SCRIPTDIR="$(cd "$(dirname "$0")"; pwd)"

PS3=$'\nChoose an option: '
options=(
  "Run Backup"
  "Run Update & Cleanup"
  "Run Log Monitor"
  "Run All"
  "Install to /usr/local/bin"
  "Exit"
)

echo "===== BASH SCRIPTING SUITE ====="
select opt in "${options[@]}"; do
  case "$REPLY" in
    1) "$SCRIPTDIR/BACKUP.sh" ;;
    2) "$SCRIPTDIR/UPDATE_CLEANUP.sh" ;;
    3) "$SCRIPTDIR/LOG_MONITOR.sh" ;;
    4)
       "$SCRIPTDIR/BACKUP.sh"
       "$SCRIPTDIR/UPDATE_CLEANUP.sh"
       "$SCRIPTDIR/LOG_MONITOR.sh"
       ;;
    5)
       echo "Installing scripts to /usr/local/bin..."
       sudo cp "$SCRIPTDIR"/*.sh /usr/local/bin/
       sudo chmod +x /usr/local/bin/*.sh
       echo "Installed successfully."
       ;;
    6)
       echo "Goodbye!"
       break
       ;;
    *)
       echo "Invalid option."
       ;;
  esac
done
