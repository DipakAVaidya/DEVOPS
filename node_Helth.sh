#!/bin/bash

#######################################
# Aurhor: Dipak
# Date: 19/03/2026
#
# This sccript outputs the node heatlth
#
# Version: v1
#####################################

set -x #debbuging debbug mode
set -e # exit the script when there is any error
set -o pipefail
df -Th

free -g

nproc

ps -ef | grep google | awk -F" " '{print $2}'
