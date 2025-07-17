# SysAdmin Server Setup Automation

This project contains a set of Bash scripts that automate key system administration tasks for a secure and monitored Ubuntu server on AWS EC2.

## Features
- Automated user creation with SSH key access
- System updates and essential package installation
- UFW firewall setup and configuration
- Security hardening with fail2ban
- Log monitoring and daily email reports
- Automated backups with cron jobs

## Usage
You can SSH into your EC2 instance and run the scripts.

### SSH Access
Connected using:
```bash
ssh -i ~/Downloads/sysadmin_deemo.pem ubuntu@18.118.139.85
```
## Scripts: 
### server-setup.sh - Server Setup Script
This script automates basic Ubuntu server setup:
- Creates a non-root sudo user
- Sets up SSH key access for secure logins
- Installs common tools (git, curl, etc.)
- Configures system timezone and hostname
- Enables the UFW firewall with SSH access

---

### secure-server.sh – Security Hardening Script
This script strengthens the security posture of a newly provisioned Ubuntu server by:
- Installing and configuring Fail2Ban to monitor SSH login attempts and block brute-force attacks  
- Disabling root login over SSH, reducing risk of privilege abuse  
-  Prepares the server for changing the default SSH port, helping obscure the attack surface  
- Restarting SSH and Fail2Ban services to apply the security changes  

---

### Why Fail2Ban

Fail2Ban is a lightweight and highly effective intrusion prevention tool. It scans system logs for suspicious behavior — like repeated failed login attempts — and temporarily bans offending IPs using the system firewall.

This provides **real-time protection** from bots and attackers who try to brute-force their way into your server via SSH.

I configured it to:

- Monitor SSH activity via the `sshd` jail  
- Ban IPs for 1 hour after 5 failed login attempts
- Automatically log and block threats without manual intervention  

Fail2Ban is ideal for cloud environments like AWS EC2, where SSH is often the only open port and a primary vector for attack.

--- 
### monitor-and-backup.sh - Logging and Monitoring Script

This script sets up basic monitoring and automated backups for your Ubuntu server.

Key Features:

- Installs monitoring tools:
  - `htop`: For real-time process monitoring
  - `sysstat`: CPU, memory, and I/O statistics
  - `logwatch`: Parses logs and generates readable reports
- Enables `sysstat` service to collect system performance data
- Creates local backups of critical directories (e.g., `/etc`)
- Adds a sample cron job (`crontab.txt`) for daily backup automation

---
### system-health-check.sh - Daily Health Reports

### Issues
- When testing the monitor-and-backup script, I had issues with ensuring the mail command did not fail. TO solve, I updated mail tools and received confirmation of functionality.

---
## Process
## Phase 1: Provisioning the EC2 Server
1. Launch EC2 instance (Ubuntu) in AWS with security gorup allowing SSH (port 22)
2. Download PEM key, secure and update permissions
3. SSH into instance

## Phase 2: Initial Configuration
1. Updated package lists and installed essential system utilities using apt.
2. Created and executed a custom server-setup.sh script to automate:
   - System updates
   - Package installations
   - Directory preparation for scripts and backups
   
## Phase 3: Securing the Server
1. Harden SSH access:
    - Disabled root login
    - Enforced key-based authentication
2. Configure Uncomplicated Firewall (UFW) to allow only trusted services (SSH, HTTP, HTTPS)
3. Install and configure Fail2Ban for monitoring and blockingg repeated brute-force login attempts
4. Verify Fail2Ban is active (sudo fail2ban-client status)

## Phase 4: Monitor and Backup
1. Install monitoring tools
  - htop: real-time process monitoring
  - syssat: performance metrics
  - logwatch: daily log summaries
2. Enable syssat logging aand set up auto-logging to systemd
3. Created auto-backups using tar with timestamped filenames

## Phase 5: Schedule Health Report
1. Created custom script to report on:
   - Disk Space
   - Memory Usage
   - System uptime
2. Integrated emails using mail command via Postfix
3. Scheduled script with ccron tto run daily at 8am

---
## Author
Sydnie Pittman — aspiring SysAdmin
