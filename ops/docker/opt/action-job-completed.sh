#!/bin/bash
set -euo pipefail

echo "[INFO] GitHub Runner Job Completed - Post-cleanup"

# Variables
RUNNER_DIR="/actions-runner"
TEMP_DIR="/tmp/runner"
WORK_DIR="$TEMP_DIR/work"

# 1️⃣ Stop any rogue processes
#echo "[INFO] Killing orphaned processes..."
#pkill -9 -f "runner" || true
#pkill -9 -f "workflow" || true

# 2️⃣ Cleanup job-specific directories
echo "[INFO] Removing job work directories..."
rm -rf "$WORK_DIR/*"

# 3️⃣ Clean up Docker (again, just in case)
echo "[INFO] Cleaning up Docker..."
docker system prune -af --volumes

# 4️⃣ Reclaim disk space
echo "[INFO] Removing temporary files..."
rm -rf /tmp/* /var/tmp/* || true
rm -rf "$TEMP_DIR/*"

# 5️⃣ Rotate logs
echo "[INFO] Rotating logs..."
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;
journalctl --vacuum-time=7d

# 6️⃣ Restart services if needed
echo "[INFO] Restarting critical services..."
#systemctl restart docker || true
#systemctl restart runner.service || true

# 7️⃣ Final disk check
echo "[INFO] Checking disk space..."
df -h /

echo "[INFO] Post-job cleanup completed!"
