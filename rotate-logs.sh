#!/usr/bin/env bash
# rotate-logs.sh — simple log rotation

# Defaults
LOG_DIR=""
RETENTION_DAYS=7
LOG_FILE="/var/log/rotate.log"

# Parse flags
while getopts "d:r:" opt; do
    case "$opt" in
        d) LOG_DIR="$OPTARG" ;;
        r) RETENTION_DAYS="$OPTARG" ;;
    esac
done

# Must be root
if [[ $EUID -ne 0 ]]; then
    echo "Run as root"
    exit 1
fi

# Directory must exist
if [[ ! -d "$LOG_DIR" ]]; then
    echo "Bad directory: $LOG_DIR"
    exit 1
fi

# Log a message with timestamp
log() {
    echo "[$(date +'%F %T')] $1" >> "$LOG_FILE"
    echo "[$(date +'%F %T')] $1"
}

log "Starting rotation in $LOG_DIR"

# Compress .log files older than 1 day
for file in "$LOG_DIR"/*.log; do
    if [[ -f "$file" ]] && [[ $(find "$file" -mtime +0) ]]; then
        gzip "$file"
        log "Compressed: $file"
    fi
done

# Delete .log.gz files older than retention
for file in "$LOG_DIR"/*.log.gz; do
    if [[ -f "$file" ]] && [[ $(find "$file" -mtime +"$RETENTION_DAYS") ]]; then
        rm "$file"
        log "Deleted: $file"
    fi
done

log "Done"