#!/bin/bash
#
#####################################
#
# Author : Dipak
# Date : 01/01/01
#
# This file showing the logs and its health details
#
# #####################################
#

LOG_DIR="/home/deepvaidyaraw/sampleFolder/logsFile"
APP_LOG_FILE="application.log"
SYS_LOG_FILE="system.log"
EROOR_PATTERN=("ERROR" "FATAL" "CRITICAL")

REPORT_FILE="/home/deepvaidyaraw/sampleFolder/logsFile/report_Analysis.txt"
> "$REPORT_FILE"
echo -e "\n  Analysing log files \n" >> "$REPORT_FILE"
echo -e "+++++++++++++++++++++++++++++++" >> "$REPORT_FILE"

echo -e "\n List of log files updated in last 24 hourse \n" >> "$REPORT_FILE"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES" >> "$REPORT_FILE"

for LOG_FILE in $LOG_FILES; do

	for PATTERN in ${EROOR_PATTERN[@]}; do

	echo -e "\n searching $PATTERN logs in $LOG_FILE file \n" >> "$REPORT_FILE"
	grep -i "$PATTERN" "$LOG_FILE" >> "$REPORT_FILE"

	echo -e "\n Number of $PATTERN logs found in $LOG_FILE \n" >> "$REPORT_FILE"
	grep -ic "$PATTERN" "$LOG_FILE" >>  "$REPORT_FILE"

	EROOR_COUNT=$(grep -c "$PATTERN" "$LOG_FILE")
	echo $EROOR_COUNT >> "$REPORT_FILE"

	if [ "$EROOR_COUNT" -gt 10 ]; then
		echo -e "\n Action Required too many $PATTERN errors in lo file  $LOG_FILE" >>  "$REPORT_FILE"
	fi
	done
done

echo " all commomd executed succesfully "

