#!/bin/bash
# This script deletes the unwanted , unused docker images in the system which increases the disk space 
space=`df .|awk '{print $5}' |grep -v 'Use%' |tr -d '%'`
echo "The current space in the machine is $space"
if [ $space -ge 80 ]
then
  docker rmi $(docker images -q -f "dangling=true")
  echo "Unwanted images have been successfully removed and the space has been cleared"
else
  echo "Current machine has enough disk space"
fi
exit 0
