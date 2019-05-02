#!/bin/bash 
#===============================================================================
#
#          FILE: 1.sh
# 
#         USAGE: ./1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 11:41:05 AM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

TESTDIR="$OS_LABS/Lab4/Task1/test"
REPORT_FILE="$OS_LABS/Lab4/report"
WEBSITE='www.net_nikogo.ru'

date=$(echo $(date) | sed "s/ /-/g")

mkdir $TESTDIR && 
    {
        echo "catalog has been created successfully" > $REPORT_FILE && 
        echo > "$TESTDIR/$date"
    }
ping $WEBSITE || echo "couldn't reach $WEBSITE" >> $REPORT_FILE

