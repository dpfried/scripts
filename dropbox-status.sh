#!/bin/sh

db_status=`/usr/bin/dropbox status`
case "$db_status" in
    "Dropbox isn't running!" ) echo -n "DB off";;
*) echo $db_status;;
esac
exit 0
