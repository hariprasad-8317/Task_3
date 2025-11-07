# System Health Check Script

## Description
This project provides a **system health monitoring script** named `healthcheck.sh`.  
It collects and logs key system statistics including:

- Date and time
- System uptime
- CPU load averages
- Memory usage
- Disk usage
- Top 5 memory-consuming processes
- Status of important services (nginx & ssh)

The script logs all output into a file named **healthlog.txt**, appending a timestamped entry.

---

## Usage Instructions

### 1. Make the script executable
```bash
chmod +x healthcheck.sh
```

### 2. Run the script
```bash
./healthcheck.sh
```

### 3. View log output
```bash
cat healthlog.txt
```

---

## Example Output (healthlog.txt)
A sample log file is included showing what output may look like.

---

## GitHub Upload Instructions
Since I cannot push to your GitHub for you, follow these steps:

```bash
git init
git add healthcheck.sh healthlog.txt README.md
git commit -m "Add health check script project"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

Replace `YOUR_USERNAME` and `YOUR_REPO_NAME` accordingly.

---

## Author
Your Name
