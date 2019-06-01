
INPUT_FILE=data.txt

PLUS_MODE=1
MUL_MODE=2

loop () {
    value=1
    current_mode=$PLUS_MODE

    line=""
    tail -n 0 -f $INPUT_FILE |
    while true; do
        read line

        case $line in
            '+')
                current_mode=$PLUS_MODE
                ;;

            '*')
                current_mode=$MUL_MODE
                ;;

            'QUIT')
                echo "Resulting value: $value"
                exit 0
                ;;

            [0-9]*) case $current_mode in
                    $PLUS_MODE)
                        ((value=$value + $line))
                        ;;

                    $MUL_MODE)
                        ((value=$value * $line))
                        ;;

                    *) 
                        >&2 echo "Unknown mode: $current_mode"
                        kill $$
                        ;;

                esac 
                ;;

            *) echo "Invalid input: <$line>"
                kill $$
                ;;
            esac 
    done
}	

loop
