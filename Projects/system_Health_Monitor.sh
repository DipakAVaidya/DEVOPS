#!/bin bash
#
###################################
#
# Author : Dipak
# Date : 23/03/26
# Version: v1
# Auto System heakth monitor
# Checks CPU, RAM, Disk every 5 min
# Alerts if usage > 80%
#
##################################

REPORT_LOG="/home/deepvaidyaraw/sampleFolder/Projects/logs/reportlog.txt"
ALERT_LOG="/home/deepvaidyaraw/sampleFolder/Projects/logs/alert.txt"
THRESHOLD=80

HOSTNAME=$(hostname)

# ------ Timestamp --------
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# ----- Functions --------

check_cpu() {
	CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)
	echo "$CPU_USAGE"
}

check_ram() {
	RAM_USAGE=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100}')
	echo "$RAM_USAGE"
}

check_disk() {
	DISK_USAGE=$(df -h | tail -1 | awk '{print $5}' | cut -d'%' -f1)
	echo "$DISK_USAGE"
}

send_alert() {
	RESOURCE=$1
	VALUE=$2
        echo "[$DATE] ⚠️ ALERT: $RESOURCE usage is ${VALUE}% on $HOSTNAME - exceeds ${THRESHOLD}%!">> "$ALERT_LOG"
        echo "[$DATE] ⚠️ ALERT: $RESOURCE usage is ${VALUE}% on $HOSTNAME - exceeds ${THRESHOLD}%!" 
}

# ------------- Main Report ---------------------
echo "============================================" >> "$REPORT_LOG"
echo " System Health Report" >> "$REPORT_LOG"
echo " Host     : $HOSTNAME" >> "$REPORT_LOG"
echo " Date     : $DATE" >> "$REPORT_LOG"
echo "============================================" >> "$REPORT_LOG"

# CPU Check
CPU=$(check_cpu)
echo "CPU Usage : ${CPU}%"  >> "$REPORT_LOG"
if [ "$CPU" -gt "$THRESHOLD" ]; then
	send_alert "CPU" "$CPU"
	echo " CPU Status : ⚠️ HIGH"  >> "$REPORT_LOG"
else
        echo " CPU Status : ✅ Normal"  >> "$REPORT_LOG"
fi

#RAM Check
RAM=$(check_ram)
echo " RAM Usage  : ${RAM}%" >> "$REPORT_LOG"
if [ "$RAM" -gt "$THRESHOLD" ]; then
    send_alert "RAM" "$RAM"
    echo " RAM Status : ⚠️  HIGH" >> "$REPORT_LOG"
else
    echo " RAM Status : ✅ Normal" >> "$REPORT_LOG"
fi

# Disk Check
DISK=$(check_disk)
echo " Disk Usage : ${DISK}%" >> "$REPORT_LOG"
if [ "$DISK" -gt "$THRESHOLD" ]; then
    send_alert "DISK" "$DISK"
    echo " Disk Status: ⚠️  HIGH" >> "$REPORT_LOG"
else
    echo " Disk Status: ✅ Normal" >> "$REPORT_LOG"
fi

echo "============================================" >> "$REPORT_LOG"
echo "" >> "$REPORT_LOG"

echo "[$DATE] Health check complete — CPU:${CPU}% RAM:${RAM}% DISK:${DISK}%"

