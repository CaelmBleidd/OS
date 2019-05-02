#!/bin/bash 
TESTDIR="$HOME/Programming/OS/Lab4/Task1/test"
REPORT_FILE="$HOME/Programming/OS/Lab4/report"
WEBSITE='www.net_nikogo.ru'

date=$(echo $(date) | sed "s/ /-/g")

mkdir $TESTDIR && 
    {
        echo "catalog has been created successfully" > $REPORT_FILE && 
        echo > "$TESTDIR/$date"
    }
ping $WEBSITE || echo "couldn't reach $WEBSITE" >> $REPORT_FILE

