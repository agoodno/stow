#!/bin/bash

#Testing internet connection
wget --spider yahoo.com
if [ "$?" != 0 ]; then
  echo "Website failed!"
fi

#Testing ssh connection to BitBucket
ssh -T git@bitbucket.org
if [ "$?" != 0 ]; then
  echo "Git failed!"
fi

#Testing ssh connection to AWS
ssh -o BatchMode=yes -o ConnectTimeout=5 integration-bastion echo 'AWS ok'
if [ "$?" != 0 ]; then
  echo "AWS failed!"
fi
