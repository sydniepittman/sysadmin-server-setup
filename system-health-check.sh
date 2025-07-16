#!/bin/bash

# Install monitoring tools
sudo apt update
sudo apt install -y htop iftop net-tools sysstat mailutils

# Enable sysstat data collection
sudo sed -i 's/ENABLED="false"/ENABLED="true"/g' /etc/default/sysstat
sudo systemctl enable sysstat
sudo systemctl start sysstat

# Create system health check script
cat << 'EOF' > /usr/local/bin/system-health-check.sh
#!/bin/bash

# Disk usage
df -h > /tmp/health-report.txt

# Memory usage
free -m >> /tmp/health-report.txt

# System uptime
uptime >> /tmp/health-report.txt

# Email report (update this address)
mail -s "Daily System Health Report" sydniegabrielle06@gmail.com < /tmp/health-report.txt
EOF

chmod +x /usr/local/bin/system-health-check.sh

# Schedule cron job for daily execution at 8AM
(crontab -l 2>/dev/null; echo "0 8 * * * /usr/local/bin/system-health-check.sh") | crontab -




