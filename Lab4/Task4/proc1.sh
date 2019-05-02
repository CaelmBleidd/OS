#!/bin/bash 
#===============================================================================
#
#          FILE: proc1.sh
# 
#         USAGE: ./proc1.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 01:39:29 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


loop () {
     a=1
     b=2
     while true ; do
         ((a=$a * $b))
         #echo $a
         #sleep 0.001
     done
}   # ----------  end of function loop  ----------

echo $$ > .proc1_pid
loop
