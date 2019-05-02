#!/bin/bash 
#===============================================================================
#
#          FILE: proc2.sh
# 
#         USAGE: ./proc2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 01:40:58 PM
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

loop
