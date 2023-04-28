#! /bin/bash
#This Script will create two files with the name 1.txt and 2.txt and rename 1.txt to name given by user.

touch "1.txt" "2.txt" |
ls -l >> 1.txt

read -p "add prefix to 1.txt?" pref

mv 1.txt ${pref}.txt

echo "done"
