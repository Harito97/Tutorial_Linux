dialog --title "Main Menu" \
    --backtitle "Linux Shell Script Tutorial" \
    --menu "Move using [UP],[DOWN],[Enter] to select" 15 50 3 \
    Date/time "Shows Date and Time" \
    Calendar "To see calendar" \
    Editor "To start vi editor" 2>input.txt

menuitem=`cat input.txt`
case $menuitem in
    Date/time) date;;
    Calendar) cal;;
    Editor) vi;;
esac
rm -f input.txt
