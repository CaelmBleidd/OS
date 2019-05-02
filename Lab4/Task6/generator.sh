#!/bin/bash 
#===============================================================================
#
#          FILE: generator.sh
# 
#         USAGE: ./generator.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 01:55:56 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

WORKER_PID_FILE=.worker_pid

loop () {
    line=""
    while true ; do
        read line
        if [[ $line == "TERM" ]] ; then
            if [[ -f $WORKER_PID_FILE ]]; then
                pid=$(cat $WORKER_PID_FILE)
                kill $pid
            fi
        fi
    done
}	# ----------  end of function loop  ----------

loop
