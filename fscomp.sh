#!/bin/bash

#Compares size of files of 2 synced dirs. Zip files are ignored.
#Prints filename and sizes if size of files do not match.

dir1=$1
dir2=$2

files1=$(find $dir1 -type f -not -iname "*.zip")

for file in ${files1}
do
  filename=$(basename $file)
  size1=$(ls -l $file | awk '{ print $5 }')
  size2=$(ls -l "$dir2/$filename" | awk '{ print $5 }')
  if [[ ! $size1 -eq $size2 ]]
    then
      echo "${filename}    ${size1}    ${size2}"
  fi
done
