#!/bin/sh

echo $(python ~/t/t.py --task-dir /osshare/dropbox/tasks --list tasks | wc -l)

exit 0
