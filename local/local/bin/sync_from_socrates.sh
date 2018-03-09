#!/bin/bash
#rsync -avz $1 --delete root@bilbo:/media/Music/ ~/Music/
rsync -avz $1 --delete --exclude ".svn" root@socrates:/media/Pictures/ ~/Pictures/
