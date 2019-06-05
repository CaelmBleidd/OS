#!/bin/bash 
TESTDIR="$HOME/Programming/OS/Lab4/Task1/test"
REPORT_FILE="$HOME/Programming/OS/Lab4/report"
WEBSITE='www.ya.ru'

date=$(echo $(date) | sed "s/ /-/g")

rm -r $TESTDIR
rm ../report

mkdir $TESTDIR && 
    {
        echo "catalog has been created successfully" > $REPORT_FILE && 
        echo > "$TESTDIR/$date"
}
(ping $WEBSITE -c4 &&  echo "$WEBSITE has been reached" >> $REPORT_FILE) || echo "couldn't reach $WEBSITE" >> $REPORT_FILE

