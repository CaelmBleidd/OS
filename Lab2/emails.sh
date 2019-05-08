#!/bin/bash
email="\b[A-Za-z0-9._%+-]+@[A-Za-z0-9_]+(\\.[A-Za-z]+)+\b"
grep -E -h -s -o -w $email /etc/* | awk '{printf("%s, ",$1)}' | sed -E "s/,\s$//g" > emails.lst
