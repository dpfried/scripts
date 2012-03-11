#!/bin/sh
batt=`acpi -b | sed 's/^.*: //g'`
echo Batt: $batt
