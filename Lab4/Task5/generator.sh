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

TEMP_FILE=data.txt

loop () {
    while true  ; do
        read line
        echo $line >> ${TEMP_FILE}
    done
}	# ----------  end of function loop  ----------

loop
