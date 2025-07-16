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
│ └── screenshots/ # Output or dashboard screenshots
└── README.md # This file

arduino
Copy
Edit

## Usage
You can SSH into your EC2 instance and run the scripts like so:

### SSH Access
Connected using:
```bash
ssh -i ~/Downloads/sysadmin_deemo.pem ubuntu@18.118.139.85


## Author
Your Name — aspiring SysAdmin
