#!/bin/bash
local="/osshare/dropbox/research/voting-experts"
remote="lectura:~/voting-experts"
rsync -e ssh --exclude "*.seg" --exclude ".*.swp" -vaurP $local/ $remote
rsync -e ssh --exclude "*.seg" --exclude ".*.swp" -vaurP $remote/ $local
