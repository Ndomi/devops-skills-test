#!/bin/bash

ls -ld */ > directories.list
sed -i "1 i\line one's line" directories.list
#head -n3 directories.list

echo -n "Enter a number: "
read number

if ! [[ $number =~ ^[0-9]+$ ]] ; then
    echo "Please enter a valid Number"
    exit 1
fi
count=1
until [ $count -gt $number ]
do
  head -n3 directories.list
  echo " "
  ((count=count+1))
done