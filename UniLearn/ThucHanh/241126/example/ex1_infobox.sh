#!/bin/bash
dialog --title "Linux Dialog Utility Infobox" \
    --backtitle "Linux Shell Script Tutorial" \
    --infobox "This is dialog box called infobox, which is usedto show some information on screen, \
    Thanks to Savio Lam and Stuart Herbert to give us this utility. Press any key. . . " 7 50;

read variable
echo "You pressed $variable"
