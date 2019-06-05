#!/bin/bash

OUT_FILE="out.txt"

ps x -o pid,cmd | awk  '{ print $1 ":" $2 }' > $OUT_FILE
echo $(cat $OUT_FILE | wc --lines) processes
