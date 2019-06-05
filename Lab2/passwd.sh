#!/bin/bash

grep -E "^[^#]*$" /etc/passwd |  awk -F  ":" '{if ($1!="^#") {print $3 " " $1}}' | sort -n
