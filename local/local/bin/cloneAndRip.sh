#!/bin/bash
IMAGE_FILE=$1
sudo readom dev='/dev/scd0' -clone f=$IMAGE_FILE -silent
echo "Ripped image $IMAGE_FILE, hit any key to start burn to blank CD"
read waituntilkey
sudo wodim dev='/dev/scd0' -raw96r -clone -v $IMAGE_FILE
