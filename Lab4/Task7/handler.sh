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


PID_FILE='.handler_pid'


add_value () {
    ((value=$value + 2))
    echo $value
}	# ----------  end of function add_value  ----------


multiply_value () {
    ((value=$value * 2))
    echo $value
}	# ----------  end of function multiply_value  ----------


interrupt() {
    echo "Interrupted by SIGTERM!"
    interrupted=1
}


loop () {

    interrupted=0
    value=1
    trap 'add_value' USR1
    trap 'multiply_value' USR2
    while (( interrupted != 1 )); do
        sleep 1s        
    done
}	# ----------  end of function loop  ----------



echo $$ > $PID_FILE

loop

rm $PID_FILE
