#!/bin/bash
set -euo pipefail

echo "[INFO] GitHub Runner Job Started - Pre-cleanup"

# Variables
RUNNER_DIR="/actions-runner"
TEMP_DIR="/tmp/runner"
WORK_DIR="$RUNNER_WORKDIR"
DOCKER_THRESHOLD=10

# 1️⃣ Stop any lingering processes from previous runs
#echo "[INFO] Killing orphaned processes..."
#pkill -9 -f "runner" || true
#pkill -9 -f "workflow" || true

# 2️⃣ Clean up old runner directories (except the current one)
echo "[INFO] Cleaning up old runner directories in ${WORK_DIR}"
find "${WORK_DIR}" -mindepth 1 -maxdepth 1 -type d -ctime +1 -exec rm -rf {} \;

# 3️⃣ Remove stale Docker containers, images, networks, and volumes
#echo "[INFO] Cleaning up Docker..."
#docker system prune -af --volumes

# 4️⃣ Verify enough disk space
DISK_USAGE=$(df -h / | awk 'NR==2 {print $4}' | sed 's/G//')
if [[ "$DISK_USAGE" -lt "$DOCKER_THRESHOLD" ]]; then
  echo "[WARNING] Low disk space! Only ${DISK_USAGE}GB available."
#  echo "[INFO] Running additional cleanup..."
#  rm -rf /var/lib/docker/tmp/*
#  docker images prune -a
fi

# 5️⃣ Ensure system limits are optimized
#echo "[INFO] Checking system limits..."
#ulimit -n 1048576
#ulimit -u 786432

# 6️⃣ Remove temp files
echo "[INFO] Removing temporary files..."
rm -rf /var/tmp/* || true

# 7️⃣ Verify runner integrity
#echo "[INFO] Checking runner integrity..."
#cd "$RUNNER_DIR" && ./config.sh --check

echo "[INFO] Pre-job cleanup completed!"
