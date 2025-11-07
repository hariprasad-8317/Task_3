$LOGFILE = "healthlog.txt"
$DATE = Get-Date

# Clear old log each run
Clear-Content $LOGFILE -ErrorAction SilentlyContinue

Add-Content $LOGFILE "===== System Health Report ====="
Add-Content $LOGFILE "Generated on: $DATE"
Add-Content $LOGFILE ""

# Date & Time
Add-Content $LOGFILE "---- Date and Time ----"
Get-Date | Out-File -Append $LOGFILE
Add-Content $LOGFILE ""

# Uptime
Add-Content $LOGFILE "---- Uptime ----"
(Get-CimInstance Win32_OperatingSystem).LastBootUpTime | 
    Out-File -Append $LOGFILE
Add-Content $LOGFILE ""

# Memory
Add-Content $LOGFILE "---- Memory Usage ----"
Get-CimInstance Win32_OperatingSystem |
    Select-Object FreePhysicalMemory,TotalVisibleMemorySize |
    Out-File -Append $LOGFILE
Add-Content $LOGFILE ""

# Disk Usage
Add-Content $LOGFILE "---- Disk Usage ----"
Get-PSDrive -PSProvider FileSystem |
    Select-Object Name,Used,Free |
    Out-File -Append $LOGFILE
Add-Content $LOGFILE ""

# Top 5 Memory Consuming Processes
Add-Content $LOGFILE "---- Top 5 Memory Consuming Processes ----"
Get-Process | Sort-Object WorkingSet -Descending | Select-Object -First 5 |
    Out-File -Append $LOGFILE
Add-Content $LOGFILE ""

# Service Status (Windows style example)
Add-Content $LOGFILE "---- Service Status ----"
foreach ($service in @("SSHD","W3SVC")) {
    if (Get-Service -Name $service -ErrorAction SilentlyContinue) {
        $state = (Get-Service $service).Status
        Add-Content $LOGFILE "${service}: ${state}"
    } else {
        Add-Content $LOGFILE "${service}: Not Installed"
    }
}
Add-Content $LOGFILE ""

Add-Content $LOGFILE "Healthcheck Completed"
Add-Content $LOGFILE "Completed at: $(Get-Date)"
Add-Content $LOGFILE "=========================================="
