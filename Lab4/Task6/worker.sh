PID_FILE='.worker_pid'

interrupt () {
    echo "Interrupted by SIGTERM!"
    interrupted=1
}

loop () {
    interrupted=0

    trap 'interrupt' SIGTERM
    echo start
    x=0
    while (( interrupted != 1 )) ; do
        ((x=$x + 1))
        sleep 1s
        echo $x
    done
}



echo $$ > $PID_FILE

loop

rm $PID_FILE
