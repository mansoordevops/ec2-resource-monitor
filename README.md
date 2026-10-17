# EC2 Resource Monitor

A lightweight Bash-based monitoring tool for Ubuntu servers running on AWS EC2. This project collects essential system information and stores monitoring reports in a log file, with automated execution through cron.

## Project Overview

The EC2 Resource Monitor demonstrates basic Linux system administration, Bash scripting, log management, task scheduling, and Git version control.

### Features

- **Date and Time:** Records when the monitoring report is generated.
- **Service Status:** Checks the status of the SSH service.
- **CPU Information:** Displays CPU-related statistics using `top`.
- **Memory Usage:** Reports memory and swap usage using `free`.
- **Disk Usage:** Displays filesystem capacity and available space using `df`.
- **Logging:** Saves monitoring output to `monitor_logs.txt`.
- **Automation:** Uses cron to run the monitoring script automatically on a daily schedule.

## Tech Stack

- **Cloud Platform:** AWS EC2
- **Operating System:** Ubuntu Linux
- **Scripting Language:** Bash
- **System Utilities:** `systemctl`, `top`, `free`, `df`, `date`
- **Automation:** cron
- **Version Control:** Git and GitHub

## Project Structure

```text
shell-assignment/
├── monitor.sh
├── monitor_logs.txt
└── README.md
```

`monitor_logs.txt` is generated when the logging command is executed. It may not be included in every clone of the repository.

## Prerequisites

- An Ubuntu EC2 instance with SSH access
- A user account with permission to run the monitoring commands
- Bash and the required Linux utilities
- Git installed
- The cron service installed and running for scheduled execution

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/mansoordevops/ec2-resource-monitor.git
cd ec2-resource-monitor
```

### 2. Make the Script Executable

```bash
chmod +x monitor.sh
```

### 3. Run the Monitoring Script

```bash
./monitor.sh
```

The report is displayed in the terminal and includes the date and time, SSH service status, CPU information, memory usage, and disk usage.

## Logging

Append the output of each run to a log file:

```bash
./monitor.sh >> monitor_logs.txt
```

View the saved reports:

```bash
cat monitor_logs.txt
```

Display only the latest 30 lines:

```bash
tail -n 30 monitor_logs.txt
```

**Note:** The `>>` operator appends output to the existing file instead of replacing its contents.

## Automating with Cron

Open the current user's crontab:

```bash
crontab -e
```

Add the following example entry to run the script every day at 9:45 AM according to the EC2 instance's configured time zone:

```cron
45 9 * * * /home/ubuntu/shell-assignment/monitor.sh >> /home/ubuntu/shell-assignment/monitor_logs.txt 2>&1
```

If the project is stored in a different directory, update both paths accordingly.

Verify the scheduled job:

```bash
crontab -l
```

Check the cron service:

```bash
sudo systemctl status cron
```

The `2>&1` portion also redirects error output to the log file, which can help with troubleshooting scheduled executions.

## Git Workflow

The project is version-controlled with Git and hosted on GitHub.

```bash
git status
git add monitor.sh README.md
git commit -m "Document EC2 resource monitoring project"
git push
```

Run these commands from the local project repository. If Git reports that there are no changes to commit, there may be nothing new to save.

## Learning Outcomes

Through this project, I practiced:

- Connecting to an AWS EC2 instance using SSH
- Writing and executing Bash scripts
- Inspecting Linux services and system resources
- Redirecting command output to log files
- Scheduling recurring tasks with cron
- Tracking changes and collaborating with Git and GitHub

## Future Improvements

- Display CPU utilization as a single percentage
- Add disk and memory threshold alerts
- Add log rotation to manage long-term log growth
- Improve error handling and command availability checks
- Add timestamped reports or structured logging

## Author

**Muhammed Mansoor**

GitHub: [@mansoordevops](https://github.com/mansoordevops)

## License

This project was created for educational purposes as part of a shell scripting and AWS EC2 assignment.
