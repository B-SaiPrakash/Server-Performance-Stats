
#!/bin/bash

echo "========================================"
echo "       SYSTEM MONITORING REPORT"
echo "========================================"

echo ""
echo "1. OS VERSION"
cat /etc/os-release | grep -E '^(NAME|VERSION)='

echo ""
echo "2. SYSTEM UPTIME"
uptime -p

echo ""
echo "3. LOAD AVERAGE"
uptime | awk -F'load average:' '{print $2}'

echo ""
echo "4. LOGGED-IN USERS"
who

echo ""
echo "5. CPU USAGE"
top -bn1 | grep "Cpu(s)"

echo ""
echo "6. MEMORY USAGE"
free -h

echo ""
echo "7. DISK USAGE"
df -h

echo ""
echo "8. TOP 5 CPU PROCESSES"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo ""
echo "9. TOP 5 MEMORY PROCESSES"
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6

echo ""
echo "10. FAILED SSH LOGINS (LAST 24 HOURS)"
sudo journalctl -u sshd --since "24 hours ago" | grep -i "Failed password" | wc -l

echo ""
echo "========================================"
echo "       MONITORING COMPLETED"
echo "========================================"

