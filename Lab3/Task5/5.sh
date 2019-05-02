#!/bin/bash 

OUT_FILE="out.txt"

for pid in $(ps ax -o pid | tail -n +2); do
    status_pid=$(grep -P "^Pid:" /proc/$pid/status | grep -o -P '\d*')
    status_ppid=$(grep -P "^PPid:" /proc/$pid/status | grep -o -P '\d*')
    sleep_avg=$(grep -P "avg_atom" /proc/$pid/sched | grep -o -P '\d*')

    if [[ -z $status_pid ]] ; then
        continue
    fi

    if [[ -z $status_ppid ]] ; then
        status_ppid=0
    fi

    if [[ -z $sleep_avg ]] ; then
        sleep_avg=0
    fi

    echo "ProcessID=$status_pid : Parent_ProcessID=$status_ppid : Average_Sleeping_Time=$sleep_avg"
done |
    sort --key=2 -V > $OUT_FILE
