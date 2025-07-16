# SysAdmin Server Setup Automation

This project contains a set of Bash scripts that automate key system administration tasks for a secure and monitored Ubuntu server on AWS EC2.

## Features
- Automated user creation with SSH key access
- System updates and essential package installation
- UFW firewall setup and configuration
- Security hardening with fail2ban
- Log monitoring and daily email reports
- Automated backups with cron jobs

```bash sysadmin-server-setup/ ├── server-setup.sh # Initial setup and provisioning ├── secure-server.sh # Security configuration ├── monitor-and-backup.sh # Monitoring tools and backups ├── crontab.txt # Cron job sample config ├── docs/ │ └── screenshots/ │ ├── server_setup.png │ ├── serverset.png │ ├── instanceID.png │ ├── ami_details.png │ └── ubuntu.jpg └── README.md # This file ``` 
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

### Author
Sydnie Pittman — aspiring SysAdmin
