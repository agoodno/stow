#!/bin/bash
rsync -avz $1 --delete ~/Music/ root@socrates:/media/Music/
