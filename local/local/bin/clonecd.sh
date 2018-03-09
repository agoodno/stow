#!/bin/bash
IMAGE_FILE=$1
sudo readom dev='/dev/scd0' -clone f=$IMAGE_FILE
