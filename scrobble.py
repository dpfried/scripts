#!/usr/bin/env python
import pylast, time, sys
from last_fm import username, password_hash
if len(sys.argv) < 3:
    print "usage:", sys.argv[0], " <artist> <song>"
    sys.exit(1)
API_KEY = 'e77b2315b7db01aa6c2e4cf035df523c'
API_SECRET = 'bf997582ab0d6b1ff9417391801979a2'
network = pylast.LastFMNetwork(api_key = API_KEY, api_secret = API_SECRET, username = username, password_hash = password_hash)
network.scrobble(sys.argv[1], sys.argv[2], int(time.time()))
