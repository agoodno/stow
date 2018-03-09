#!/bin/bash
rsync -avz $1 --delete --exclude ".svn" ~/Pictures/ "/media/andrew/Expansion Drive/Pictures/"
