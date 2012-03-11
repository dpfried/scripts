#!/usr/bin/python
from pynotify import *
import sys
import pygtk
import gtk
import urllib

def notify(station, time, s, url):
    n = Notification(s, time + '\n' + station)
    if len(url) > 0:
        f = urllib.urlopen(url)
        data = f.read()
        pbl = gtk.gdk.PixbufLoader()
        pbl.write(data)
        pbuf = pbl.get_pixbuf()
        pbl.close()
	n.set_icon_from_pixbuf(pbuf)
    n.show()

def notifySplit(station, time, track, artist, album, url):
    n = Notification(track, artist + '\n' + album + '\n' + time + '\n' + station)
    if len(url) > 0:
        f = urllib.urlopen(url)
        data = f.read()
        pbl = gtk.gdk.PixbufLoader()
        pbl.write(data)
        pbuf = pbl.get_pixbuf()
        pbl.close()
	n.set_icon_from_pixbuf(pbuf)
    n.show()

init("cli notify")
if len(sys.argv) > 1:
    s = sys.argv[3][1:]
    if len(sys.argv[4]) > 1:
        s = s + " by " + sys.argv[4][1:]
    if len(sys.argv[5]) > 1:
        s = s + " on " + sys.argv[5][1:]
    notify(sys.argv[1][1:], sys.argv[2][1:], s, sys.argv[6][1:])
else:
    notify()

