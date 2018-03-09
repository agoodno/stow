#!/bin/bash
rsync -avz $2 /Users/agoodnough/Music/$1/ root@192.168.1.3:/media/Music/$1
