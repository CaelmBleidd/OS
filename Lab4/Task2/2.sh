#!/bin/bash 
#===============================================================================
#
#          FILE: 2.sh
# 
#         USAGE: ./2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: NewUserKK (), 
#  ORGANIZATION: 
#       CREATED: 04/20/2019 12:07:51 PM
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

../Task1/1.sh
at now + 2 minutes < ../Task1/1.sh
tail -n 0 -f ../report


