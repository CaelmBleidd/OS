#!/bin/bash

grep -E -r -o -h "ACPI.*" /var/log > errors.log
grep -E -r -h "^.*[:alnum:]\.*[:alpha:]" errors.log
