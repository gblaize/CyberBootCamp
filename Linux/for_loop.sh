#!/bin/bash

provs=('Ontario' 'Quebec' 'Alberta' 'BC' 'PEI') 

for province in ${provs[@]}
do

if [ $province == 'Alberta' ];
then 
 echo 'Alberta is the best!'
else
 echo "I'm not a fan of Alberta"
fi

done

nums=$(echo {0..9})
echo $nums

nums2=$(seq 3 12)
echo $nums2
~
~
