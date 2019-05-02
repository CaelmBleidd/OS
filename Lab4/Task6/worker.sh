#!/bin/bash 
#===============================================================================
#
#          FILE: handler.sh
# 
#         USAGE: ./handler.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 02:05:36 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


PID_FILE='.worker_pid'

interrupt () {
    echo "Interrupted by SIGTERM!"
    interrupted=1
}

loop () {
    interrupted=0

    trap 'interrupt' SIGTERM
    echo start
    x=0
    while (( interrupted != 1 )) ; do
        ((x=$x + 1))
        sleep 1s
        echo $x
    done
}	# ----------  end of function loop  ----------



echo $$ > $PID_FILE

loop

rm $PID_FILE
