#!/bin/bash

echo "Tuan 07: Cac toan tu trong lap trung shell va Vong lap" > tailieu.txt
echo "Created tailieu.txt and here is it's content: "
cat tailieu.txt

echo "Copy content of tailieu.txt to tailieu_{1..3}.txt"
echo "And content of tailieu_{1..3}.txt: "
for ((i=1;i<=3;i++))
do
	cat ./tailieu.txt > ./tailieu_$i.txt
    	cat ./tailieu_$i.txt
done

echo "Clean all txt file"
rm ./*.txt
