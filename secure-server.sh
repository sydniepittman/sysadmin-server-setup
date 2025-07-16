#!/bin/bash

# Exit if any command fails
set -e

# Install Fail2Ban
echo "[+] Installing Fail2Ban..."
apt install -y fail2ban

# Enable and Start Fail2Ban
echo "[+] Enabling Fail2Ban..."
systemctl enable fail2ban
systemctl start fail2ban

# Configure Fail2Ban for SSH
echo "[+] Writing SSH jail.local config..."
cat <<EOF | tee /etc/fail2ban/jail.local > /dev/null
[sshd]
enabled = true
port = ssh
backend = systemd
maxretry = 5
bantime = 3600
findtime = 600
EOF

# Restart Fail2Ban to apply config
echo "[+] Restarting Fail2Ban..."
systemctl restart fail2ban

# Disable root login via SSH
echo "[+] Disabling root login in sshd_config..."
sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

# Restart SSH service
echo "[+] Restarting SSH..."
systemctl restart ssh

echo "[✔] Server security hardening complete."


