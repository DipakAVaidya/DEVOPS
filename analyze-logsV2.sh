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

echo -e "\n  Analysing log files \n"
echo -e "+++++++++++++++++++++++++++++++"

echo -e "\n List of log files updated in last 24 hourse \n"
find $LOG_DIR -name "*.log" -mtime -1

echo -e "\n searching ERROR logs in applicatio.log file \n"
grep -i "${EROOR_PATTERN[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\n Number of ERROR logs found in aplication.log \n"
grep -ic "${EROOR_PATTERN[0]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\n Number of FATAL logs found in aplication.log \n"
grep -ic "${EROOR_PATTERN[1]}" "$LOG_DIR/$APP_LOG_FILE"

echo -e "\n Number of FATAL logs found in System.log \n"
grep -ic "${EROOR_PATTERN[1]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\n Number of CRITICAL logs found in System.log \n"
grep -ic "${EROOR_PATTERN[2]}" "$LOG_DIR/$SYS_LOG_FILE"

echo -e "\n Number of CRITICAL logs found in Application.log \n"
grep -ic "${EROOR_PATTERN[2]}" "$LOG_DIR/$APP_LOG_FILE"


