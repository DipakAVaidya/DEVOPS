#!/bin/bash

#####################################
# Author: Dipak
# Date : 20/03/26
# Content : os_info
# version : v01
# ###################################
#

set -xeo pipefail

echo "Date : $(date)"
echo "User : $(whoami)"
echo  "Disk Storage Usage"
df -Th /

echo "Memory " 
free -h

echo "Version"
cat /etc/os-release
