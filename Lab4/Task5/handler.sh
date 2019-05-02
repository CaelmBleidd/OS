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


INPUT_FILE=data.txt

PLUS_MODE=1
MUL_MODE=2

loop () {
    value=1
    current_mode=$PLUS_MODE

    line=""
    tail -n 0 -f $INPUT_FILE |
    while true; do
        read line

        case $line in
            '+')
                current_mode=$PLUS_MODE
                ;;

            '*')
                current_mode=$MUL_MODE
                ;;

            'QUIT')
                echo "Resulting value: $value"
                exit 0
                ;;

            [0-9]*) case $current_mode in
                    $PLUS_MODE)
                        ((value=$value + $line))
                        ;;

                    $MUL_MODE)
                        ((value=$value * $line))
                        ;;

                    *) 
                        >&2 echo "Unknown mode: $current_mode"
                        kill $$
                        ;;

                esac    # --- end of case ---
                ;;

            *) echo "Invalid input: <$line>"
                kill $$
                ;;
            esac    # --- end of case ---
    done
}	# ----------  end of function loop  ----------

loop
