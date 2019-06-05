#!/bin/bash

TRASH_DIR=../.trash
TRASH_LOG=../.trash.log

restore_file () {
    path=$1
    filename=$2
    ln "$TRASH_DIR/$filename" $path
}


filename=$1
line=""
grep $filename $TRASH_LOG |
while read line; do
    file_to_restore=$(echo $line | cut -d " " -f 1)
    file_in_trash=$(echo $line | cut -d " " -f 2)
    echo $file_in_trash

    echo "Restore $file_to_restore ? (y/n)"
    read answer < /dev/tty
    if [[ "$answer" == "y" ]]; then
        parent_directory=$(dirname "$file_to_restore") &&
            if [[ -d "$parent_directory" ]]; then
                $(restore_file "$file_to_restore" "$file_in_trash")
            else
                $(restore_file "$HOME/$filename" "$file_in_trash") &&
                    echo "Directory $parent_directory not exists anymore, restoring at $HOME"
            fi &&
            rm $TRASH_DIR/$file_in_trash && {
                sed -i "#$line#d" $TRASH_LOG
                echo "Restored $file_to_restore"
            }
    fi
done
