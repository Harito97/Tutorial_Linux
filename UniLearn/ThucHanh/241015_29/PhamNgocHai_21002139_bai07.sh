#!/bin/bash

for ((i=1;i<=4;i++))
do
	content=`expr 'Toi la sinh vien ' + $i`
	echo $content > file_$i.txt
	echo file_$i.txt
done

echo 'Created 4 file: file_{1..4}.txt'
echo 'Cleaned files'
rm *.txt
