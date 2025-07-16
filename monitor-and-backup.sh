#!/bin/bash

# Exit script if any command fails
set -e

echo "[+] Updating package list..."
sudo apt update

echo "[+] Installing monitoring tools (htop, sysstat, logwatch)..."
sudo apt install -y htop sysstat logwatch

# Enable sysstat logging
echo "[+] Enabling sysstat logging..."
sudo sed -i 's/ENABLED="false"/ENABLED="true"/' /etc/default/sysstat
sudo systemctl enable sysstat
sudo systemctl start sysstat

# Create backup directory
BACKUP_DIR="/home/ubuntu/backups"
echo "[+] Creating backup directory at $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

# Backup /etc configuration files
TIMESTAMP=$(date +"%F-%H%M")
BACKUP_FILE="$BACKUP_DIR/etc-backup-$TIMESTAMP.tar.gz"
echo "[+] Creating backup of /etc as $BACKUP_FILE"
tar -czvf "$BACKUP_FILE" /etc

# Run logwatch summary
echo "[+] Running logwatch report (viewable in terminal)..."
sudo logwatch --detail Low --range today --service all --format text

echo "[✔] Monitoring tools installed and backup complete."
