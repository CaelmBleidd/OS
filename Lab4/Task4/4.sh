#!/bin/bash 
#===============================================================================
#
#          FILE: 4.sh
# 
#         USAGE: ./4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 01:15:31 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

( ./proc1.sh & )
sleep 0.1
( cpulimit --pid=$(cat .proc1_pid) --limit=20 & disown)
( ./proc2.sh & )
