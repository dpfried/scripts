#!/bin/bash
local="/home/dfried/sem3"
remote="lectura:~/sem3"
# rsync -e ssh --exclude "*.seg" --exclude ".*.swp" -vaurP $local/ $remote
# rsync -e ssh --exclude "*.seg" --exclude ".*.swp" -vaurP $remote/ $local
rsync -e ssh --exclude ".metadata" -vaurP $local/ $remote
rsync -e ssh --exclude ".metadata" -vaurP $remote/ $local

