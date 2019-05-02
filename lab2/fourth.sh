#!/bin/bash
grep -E -r -l '^#!(.*)' $1 > tmpfile.txt
FILE=tmpfile.txt
while read LINE; do
   ls -l $LINE
done < $FILE | cut -d ' ' -f 4 | awk '{cnt[$0]+=1} END{for (i in cnt){print(cnt[i] " " i)}}' | sort -r -n -k 1 | sed 1q
rm $FILE
