WORKER_PID_FILE=.worker_pid

loop () {
    line=""
    while true ; do
        read line
        if [[ $line == "TERM" ]] ; then
            if [[ -f $WORKER_PID_FILE ]]; then
                pid=$(cat $WORKER_PID_FILE)
                kill $pid
            fi
        fi
    done
}

loop
