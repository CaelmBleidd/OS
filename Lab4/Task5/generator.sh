
TEMP_FILE=data.txt

loop () {
    while true  ; do
        read line
        echo $line >> ${TEMP_FILE}
    done
}

loop
