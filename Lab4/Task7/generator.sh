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

HANDLER_PID_FILE=.handler_pid

loop () {
    line=""
    while true ; do
        read line
        
        signal=""
        echo $line
        case $line in
            "+") signal=USR1
                ;;

            "*") signal=USR2
                ;;

            "TERM") signal=SIGTERM
                ;;

#            *)
#                ;;

        esac    # --- end of case ---
        
        kill -"$signal" $(cat $HANDLER_PID_FILE)
    done
}	# ----------  end of function loop  ----------

loop
