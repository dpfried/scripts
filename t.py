#!/usr/bin/python
from pynotify import *
import sys
import commands
import pygtk
import gtk

def notify(message = ""):
    n = Notification(message)
    if len(sys.argv) > 1:
        n.set_icon_from_pixbuf(gtk.gdk.pixbuf_new_from_file(sys.argv[1]))
    n.show()

init("cli notify")
test = commands.getoutput('python ~/t/t.py --task-dir /osshare/dropbox/tasks --list tasks')
notify(test)
