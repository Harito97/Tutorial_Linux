dialog --title "Inputbox - To take input from you" \
    --backtitle "Linux ShellScript Tutorial" \
    --inputbox "Enter your name please" 8 60 2>input.txt

sel=$?
name=`cat input.txt`
case $sel in
    0) echo "Hello $name" ;;
    1) echo "Cancel is Press" ;;
    255) echo "[ESCAPE] key pressed" ;;
esac
rm -f input.txt
# cau lenh 2>input.txt de dua gia tri nhap vao tep input.txt
