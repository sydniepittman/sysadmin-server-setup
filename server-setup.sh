  GNU nano 7.2                          server-setup.sh                                    
#!/bin/bash

# Exit script on error
set -e

# CONFIG
admin="sysadmin"
SSH_PUBLIC_KEY="paste-your-actual-SSH-public-key-here"

# Update System 
echo "[+] Updating system..."
apt update && apt upgrade -y

# Create New User
echo "[+] Creating user: $admin"
adduser --disabled-password --gecos "" $admin
usermod -aG sudo $admin

# Add SSH Key for New User 
echo "[+] Setting up SSH for $admin"
mkdir -p /home/$admin/.ssh
echo "$SSH_PUBLIC_KEY" > /home/$admin/.ssh/authorized_keys
chmod 600 /home/$admin/.ssh/authorized_keys
chown -R $admin:$admin /home/$admin/.ssh

# Install Basic Packages
echo "[+] Installing packages..."
apt install -y curl git ufw htop

# Set Timezone
echo "[+] Setting timezone to America/New_York"
timedatectl set-timezone America/New_York

# Set Hostname
echo "[+] Setting hostname to sysadmin-demo"
hostnamectl set-hostname sysadmin-demo

# Configure UFW Firewall 
echo "[+] Configuring UFW..."
ufw allow OpenSSH
ufw --force enable

echo "[✔] Server setup complete."

