#!/bin/bash

set -o nounset                              # Treat unset variables as an error

calc_expr() {
    echo $1 | bc -l
}	# ----------  end of function calc_expr  ----------

INPUT_FILE="../Task5/out.txt"
OUT_FILE="out.txt"

previous_ppid=-1
acc_avg_sleep=0
process_counter=0

while read line ; do
    ppid=$(echo $line | cut -d ":" -f 2 | grep -P -o "\d+")
    avg_sleep=$(echo $line | cut -d ":" -f 3 | grep -P -o "\d+")

    if (( previous_ppid != -1 && ppid != previous_ppid )) ; then
        echo Average_Sleeping_Children_of_ParentID=$previous_ppid is $(calc_expr "$acc_avg_sleep / $process_counter")
        acc_avg_sleep=0
        process_counter=0
    fi

    echo $line

    acc_avg_sleep=$(calc_expr "$acc_avg_sleep + $avg_sleep")
    process_counter=$((process_counter + 1))
    previous_ppid=$ppid
done < $INPUT_FILE > $OUT_FILE

echo Average_Sleeping_Children_of_ParentID=$previous_ppid is $(calc_expr "$acc_avg_sleep / $process_counter") >> $OUT_FILE
