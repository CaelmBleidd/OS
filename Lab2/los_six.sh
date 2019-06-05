#!/bin/bash

find /var/log -name "*.log" -type f | xargs -n 1 wc -l #| tail -1 | grep -o -E "[[:digit:]]+"
