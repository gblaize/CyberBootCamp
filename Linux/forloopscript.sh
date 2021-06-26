#!/bin/bash

output=$HOME/research/sys_info.txt

files=('/etc/passwd/' 'etc/shadow/')

echo "The permissions for sensitive files are: " > $output
for file in ${files[@]}
do
ls -l $file >> $output
done

#Example #1 of using IF to create the directory only if it doesn't exist
if [ ! -d ~/research ]
then 
 mkdir ~/research
fi
