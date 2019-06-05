
PID_FILE='.handler_pid'


add_value () {
    ((value=$value + 2))
    echo $value
}


multiply_value () {
    ((value=$value * 2))
    echo $value
}


interrupt() {
    echo "Interrupted by SIGTERM!"
    interrupted=1
}


loop () {

    interrupted=0
    value=1
    trap 'add_value' USR1
    trap 'multiply_value' USR2
    trap 'interrupt' SIGTERM
    while (( interrupted != 1 )); do
        sleep 1s        
    done
}



echo $$ > $PID_FILE

loop

rm $PID_FILE
