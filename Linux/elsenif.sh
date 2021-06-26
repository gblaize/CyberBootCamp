#!/bin/bash

if [ -d ~/research ]
then 
        echo "Directory already exists"
else
mkdir ~/research
fi

if [ -f ~/research/sys_info.txt ]
then 
rm ~/research/sys/info.txt
else
echo "Sys_info.txt file exists"
fi

#string variables
str1='ip addr | grep inet | tail -2 | head -1'

str2='find /home -type f -perm 777'

