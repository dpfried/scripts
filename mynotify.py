#!/usr/bin/python
from pynotify import *
import sys

def notify(message=""):
	n = Notification("Command Line Completed", message)
	n.show()

init("cli notify")
if len(sys.argv) > 1:
	notify(sys.argv[1])
else:
	notify()
