#!/bin/bash

set -o nounset                              # Treat unset variables as an error

ps ax -o pid,start --sort=start_time | tail -n 1 | awk '{ print "PID: " $1 ", start time: ", $2}'
