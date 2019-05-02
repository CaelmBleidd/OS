
HANDLER_PID_FILE=.handler_pid

loop () {
    line=""
    while true ; do
        read line
        
        signal=""
        case $line in
            "+") signal=USR1
                ;;

            "*") signal=USR2
                ;;

            "TERM") signal=SIGTERM
                ;;
        esac
        
        kill -"$signal" $(cat $HANDLER_PID_FILE)
    done
}

loop
