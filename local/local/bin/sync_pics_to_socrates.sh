#!/bin/bash
rsync -avz $1 --delete ~/Dropbox/Media/ root@socrates:/media/Pictures/
