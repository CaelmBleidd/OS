#!/bin/bash

OUT_FILE="out.txt"
PAGESIZE=$(getconf PAGESIZE)

output=""
for pid in $(ps ax -o pid | tail +2); do
    resident=$(cut -d " " -f 2 /proc/$pid/statm)
    shared=$(cut -d " " -f 3 /proc/$pid/statm)
    ((diff=resident - shared))
    if [[ $diff ]]; then
        output="$output$pid $diff\n"
    fi
done

printf "$output" | sort --reverse --numeric-sort --key=2 | awk '{print $1 ":" $2}' > $OUT_FILE
