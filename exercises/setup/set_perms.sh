#!/bin/bash

cd ~/exercises

for i in `find . -type f -print | grep sh$`
do
echo $i
chmod 755 $i
ls -l $i
done

chmod 755 R/cheat.r
chmod 755 noSQL/exttab/bin/nosql_stream


