#!/bin/bash
grep -E -r -o -s -h '^#!(.*)' /bin | awk '{cnt[$0]+=1} END{for (i in cnt){print(cnt[i] " " i)}}' | sort -r -n -k 1|
sed 1q | sed -E "s/.*#!(.*)/\1/"

