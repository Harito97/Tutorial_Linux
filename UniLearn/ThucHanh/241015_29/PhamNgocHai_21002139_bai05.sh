#!/bin/bash

# Create temp file
touch ~/Desktop/temp{1..5}.sh
touch ~/Desktop/temp{1..5}.txt

echo '+ Liệt kê tất cả các file và thư mục trong ~/Desktop: '
ls -a ~/Desktop

echo -e '\n+ Liệt kê tất cả các file có đuôi .sh trong thư mục ~/Desktop: '
ls -a ~/Desktop/*.sh

# Clean temp file
rm ~/Desktop/temp{1..5}.sh
rm ~/Desktop/temp{1..5}.txt
