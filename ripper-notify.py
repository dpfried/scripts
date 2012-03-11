#!/usr/bin/python
from pynotify import *
import sys
import pygtk
import gtk
import urllib

def notify(s):
    n = Notification("recording", s)
    n.show()

def notifySplit(station, time, track, artist, album):
    n = Notification(track, artist + '\n' + album + '\n' + time + '\n' + station)
    n.show()

init("cli notify")
if len(sys.argv) > 1:
    s = sys.argv[1]
    if len(sys.argv[3]) > 0:
        s = s + " by " + sys.argv[3]
    if len(sys.argv[2]) > 0:
        s = s + " on " + sys.argv[2]
    notify(s)
else:
    notify()

