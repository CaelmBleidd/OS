#!/bin/bash

man bash | tr -cs "[:alpha:]" "[\n*]" | grep -E ".{4,}" | sort | uniq -ic | sort -nr | head -3
