#!/bin/bash
sudo service dbus restart
sudo service network-manager restart
nm-applet &!
gnome-settings-daemon &!
