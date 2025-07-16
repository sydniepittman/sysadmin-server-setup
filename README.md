# SysAdmin Server Setup Automation

This project contains a set of Bash scripts that automate key system administration tasks for a secure and monitored Ubuntu server on AWS EC2.

## Features
- Automated user creation with SSH key access
- System updates and essential package installation
- UFW firewall setup and configuration
- Security hardening with fail2ban
- Log monitoring and daily email reports
- Automated backups with cron jobs

## Folder Structure
sysadmin-server-setup/
├── server-setup.sh # Initial setup and provisioning
├── secure-server.sh # Security configuration
├── monitor-and-backup.sh # Monitoring tools and backups
├── crontab.txt # Cron job sample config
├── docs/
│ └── screenshots/
│   └──server_setup
│   └──sever_setup(2).png
│   └──instanceID.png
│   └──ami_details.png
│   └──ubuntu.png
└── README.md # This file

arduino
Copy
Edit

## Usage
You can SSH into your EC2 instance and run the scripts.

### SSH Access
Connected using:
```bash
ssh -i ~/Downloads/sysadmin_deemo.pem ubuntu@18.118.139.85
```
## Scripts: 
### server-setup.sh
This script automates basic Ubuntu server setup:
- Creates a non-root sudo user
- Sets up SSH key access for secure logins
- Installs common tools (git, curl, etc.)
- Configures system timezone and hostname
- Enables the UFW firewall with SSH access

### Author
Sydnie Pittman — aspiring SysAdmin
