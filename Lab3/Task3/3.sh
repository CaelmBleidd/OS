#!/bin/bash


set -o nounset                              # Treat unset variables as an error

OUT_FILE="out.txt"

ps ax -o pid,cmd | awk '{ if($2 ~ /^\/sbin\/.*/) print $1 }' > $OUT_FILE
