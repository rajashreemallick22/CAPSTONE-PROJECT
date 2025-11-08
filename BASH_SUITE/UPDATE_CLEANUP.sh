#!/usr/bin/env bash
# UPDATE_CLEANUP.sh - run safe updates and cleanup
set -euo pipefail

source "$(dirname "$0")/CONFIG.sh"

echo "[$(date '+%F %T')] Starting system update & cleanup" | tee -a "$LOG_FILE"

if command -v apt-get >/dev/null 2>&1; then
  PM="apt"
elif command -v dnf >/dev/null 2>&1; then
  PM="dnf"
elif command -v yum >/dev/null 2>&1; then
  PM="yum"
else
  echo "No supported package manager found (apt/dnf/yum)." | tee -a "$LOG_FILE"
  exit 1
fi

if [[ $EUID -ne 0 ]]; then
  echo "Re-running with sudo..."
  exec sudo bash "$0" "$@"
fi

case "$PM" in
  apt)
    apt-get update -y
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
    apt-get autoremove -y
    apt-get autoclean -y
    ;;
  dnf)
    dnf upgrade --refresh -y
    dnf autoremove -y
    ;;
  yum)
    yum update -y
    yum autoremove -y
    ;;
esac

echo "[$(date '+%F %T')] Update & cleanup finished" | tee -a "$LOG_FILE"
