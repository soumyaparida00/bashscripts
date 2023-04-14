#!/bin/bash
# This script will create 500 files from file.txt to file500.txt. And each file will contain the name of the file in it and,
then all the files will be tar.gz'd to another file.

for i in {000..500}
do 
    echo file${i}.txt > file${i}.txt
done | tar -czvf test.tar.gz ./*
