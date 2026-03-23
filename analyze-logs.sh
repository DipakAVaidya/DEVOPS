#!/bin/bash
#
############################
# Author : Dipak
# Date : 21/02/
#
# version: v01
#
# this file show the logs analyses and count of all variables
##################################
#

set -x

# ifnd alll log files from yesterday
echo -e "\nfind alll log files from yesterday "
find . -name "*.log" -mtime -1

# Search for ERROR in a log file

echo -e "\nSearch for ERROR in a log file"
grep "ERROR" /home/deepvaidyaraw/sampleFolder/logsFile/application.log

#Count how many errors are in the file
echo -e "\nCount how many errors are in the file"
grep -c "ERROR" /home/deepvaidyaraw/sampleFolder/logsFile/application.log

#find the most recent errors
echo -e "\nfind the most recent errors"
grep "ERROR" /home/deepvaidyaraw/sampleFolder/logsFile/application.log | tail -1

# Look for FATAL Errors in another log file
echo -e "\nLook for FATAL Errors in another log file"
grep "FATAL" /home/deepvaidyaraw/sampleFolder/logsFile/system.log
