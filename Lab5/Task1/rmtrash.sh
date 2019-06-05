#!/bin/bash

TRASH_DIR=../.trash
TRASH_LOG=../.trash.log

filename=$1

if [[ ! -d "$TRASH_DIR" ]]; then
    mkdir $TRASH_DIR
fi

counter=0
trash_name="$filename-$counter"
while [[ -e "$TRASH_DIR/$trash_name" ]] ; do
    ((counter=counter + 1))
    trash_name="$filename-$counter"
done

ln $filename "$TRASH_DIR/$trash_name"
rm $filename && echo "$(realpath $filename) $trash_name" >> "$TRASH_LOG"
