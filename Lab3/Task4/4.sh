#!/bin/bash


set -o nounset                              # Treat unset variables as an error

#exec 2> /dev/null  # ignore stderr

OUT_FILE="out.txt"
PAGESIZE=$(getconf PAGESIZE)

calc_expr() {
    echo $1 | bc -l
}	# ----------  end of function calc_expr  ----------

output=""
for pid in $(ps ax -o pid | tail +2); do
    resident=$(cut -d " " -f 2 /proc/$pid/statm)
    shared=$(cut -d " " -f 3 /proc/$pid/statm)
    diff=$(echo "($resident - $shared) * $PAGESIZE" | bc -l)
    if [[ $diff ]]; then
        output="$output$pid $(echo $diff | numfmt --to=iec)\n"
    fi
done

printf "$output" | sort --reverse --numeric-sort --key=2 | awk '{print $1 ":" $2}' > $OUT_FILE
