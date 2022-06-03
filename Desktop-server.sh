#!/bin/bash

echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗     ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ";
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ";
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝    ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    ";
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ";
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║         ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ";
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ";
echo "                                                                                                                   ";
echo "                                                                                                                   ";
echo "                                                                                                                   ";

# first info message for sudo prems
dialog --title "Information about the script" --infobox "Welcome to the Desktop-server script! \nlet me explain the script dose \nso this script will run through some menus to install and costing your machine \nvery simple \n\n\nPLEASE WAIT 5SECONDS" 10 60;sleep 7;

dialog --title "do you want to run this script"  --backtitle "Desktop server Script"  --yesno "This script will install and modify fieles \nif you are runing this with sudo do not do continue" 10 60

run_ing=$?

case $run_ing in
   0) echo "contuned";; #yes
   1) exit;; #no
   255) exit;; #exit
esac

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

#### main menu ####
display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

# main menu tree 
while true; do
  exec 3>&1
  selection=$(dialog \
      --backtitle "Desktop server Script" \
      --title "install selection" \
      --clear \
      --cancel-label "Exit" \
      --menu "Please select:" $HEIGHT $WIDTH 10 \
      # thise are goign to be referenced fourter on with "n)"
      "1" "Drives" \
      "2" "Login Manger" \
      "3" "Desktop / Window Manger" \
      "4" "Comunication" \
      "5" "Developer tools" \
      "6" "Office" \
      "7" "Multimedia" \
      "8" "Personal choices" \
      2>&1 1>&3)
   
   # just need to exit the script not very inportant than the rest
   exit_status=$?
   exec 3>&-
   case $exit_status in 
      $DIALOG_CANCEL)
      clear
      echo "Exited."
      exit
      ;;
      $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
   esac
  
  # very impotant the main selection from all the menus before the exit comand
  # any changes in the selection will effect the rest of the script
  # if you are changeing anythig here please test it

   case $selection in
      1 ) # Drives menu
         # case 1 line 48
         # first selection drives
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Drives" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Nvidia" \
               "2" "nouveau" \
               "3" "intel" \
               "4" "amd" \
               2>&1)
            esac
            case $selection in
               1 )
                  while true; do
                  exec 2>&1
                  selection=$(dialog \
                     --backtitle "Desktop server Script" \
                     --title "Drives" \
                     --clear \
                     --cancel-label "Exit" \
                     --menu "Please select:" $HEIGHT $WIDTH 10 \
                     "1" "Auto-detect and install" \
                     "2" "" \
                     "3" "" \
                     "4" "" \
                     2>&1)
                  # arch nvidia nvidia-utils nvidia-settings
                  # sudo ubuntu-drivers autoinstall
                  # sudo apt install nvidia "nuber" make a text box with this and tell them to put the card nuber
                  ;;
               2 )
                  result="nouveau is installing"
                  display_result "$result"
                  sudo pacman -S nouveau nvidia-utils nvidia-settings --noconfirm
                  result="nouveau is installed"
                  display_result "$result"
                  ;;
               3 )
                  result="intel is installing"
                  display_result "$result"
                  sudo pacman -S intel-dri --noconfirm
                  result="intel is installed"
                  display_result "$result"
                  ;;
               4 )
                  result="amd is installing"
                  display_result "$result"
                  sudo pacman -S amd-dri --noconfirm
                  result="amd is installed"
                  display_result "$result"
                  ;;
               * )
                  clear
                  echo "Exited."
                  exit
               ;;
            # this migth fuck up the script if you are not using the right way to exit or just ues to much memorey
      2 ) # Login manager menu
         while true; do
                  exec 2>&1
                  selection=$(dialog \
                     --backtitle "Desktop server Script" \
                     --title "Personal choices" \
                     --clear \
                     --cancel-label "Exit" \
                     --menu "Please select:" $HEIGHT $WIDTH 10 \
                     "1" "Terminals" \
                     "2" "Themes" \
                     "3" "" \
                     "4" "amd" \
                     2>&1)
                     case $selection in
                     1 ) exit;; #

                     * )
                        clear
                        echo "Exited."
                        exit
                     ;;
      3 ) # Desktop / Window Manger Menu
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Desktop Manger / Window Manger" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Desktop" \
               "2" "Window Manger" \

               2>&1)
               case $selection in
               1 ) 
                  while true; do
                  exec 2>&1
                  selection=$(dialog \
                     --backtitle "Desktop server Script" \
                     --title "WM" \
                     --clear \
                     --cancel-label "Exit" \
                     --menu "Please select:" $HEIGHT $WIDTH 10 \
                     "1" "I3" \
                     "2" "Awesome WM" \
                     "3" "bspwm" \
                     "4" "Qtile" \
                     2>&1)
                     case $selection in
               2) 
                  while true; do
                  exec 2>&1
                  selection=$(dialog \
                     --backtitle "Desktop server Script" \
                     --title "Desktop Manger" \
                     --clear \
                     --cancel-label "Exit" \
                     --menu "Please select:" $HEIGHT $WIDTH 10 \
                     "1" "Kde" \
                     "1" "Kde Base" \
                     "2" "Gnome" \
                     "3" "Xfce" \
                     "4" "LXDE" \
                     "5" "LXQt" \
                     "6" "Mate" \
                     "7" "Cinnamon" \
                     "8" "Budgie" \
                     2>&1)
                     case $selection in
                  # install with the apt pakege manager
                  1) 
                     sudo pacman -S kde-applications --noconfirm
                     ;;
                  2) 
                     result="Gnome is installing"
                     display_result "$result"
                     sudo pacman -S gnome --noconfirm
                     result="Gnome is installed"
                     display_result "$result"
                     ;;
                  3) 
                     result="Xfce is installing"
                     display_result "$result"
                     sudo pacman -S xfce4 xfce4-goodies --noconfirm
                     result="Xfce is installed"
                     display_result "$result"
                     ;;
                  4)
                     sudo apt install lxde 
                  5) 
                     result="LXQt is installing"
                     display_result "$result"
                     sudo pacman -S lxqt --noconfirm
                     result="LXQt is installed"
                     display_result "$result"
                     ;;
                  6) 
                     result="Mate is installing"
                     display_result "$result"
                     sudo pacman -S mate mate-extra --noconfirm
                     result="Mate is installed"
                     display_result "$result"
                     ;;
                  7) 
                     result="Cinnamon is installing"
                     display_result "$result"
                     sudo pacman -S cinnamon --noconfirm
                     result="Cinnamon is installed"
                     display_result "$result"
                     ;;
                  8) 
                     result="Budgie is installing"
                     display_result "$result"
                     sudo pacman -S budgie-desktop --noconfirm
                     result="Budgie is installed"
                     display_result "$result"
                     ;;
                  9 ) 
                     result="LXQt is installing"
                     display_result "$result"
                     sudo pacman -S lxqt --noconfirm
                     result="LXQt is installed"
                     display_result "$result"
                     ;;

                  * )
                     clear
                     echo "Exited."
                     exit
                     ;;
                     
      4 ) # Comunication menu 
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Developer tools" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Terminals" \
               "2" "Themes" \
               "3" "" \
               "4" "amd" \
               2>&1)
               case $selection in
               1 ) exit;; #

               * )
                  clear
                  echo "Exited."
                  exit
                  ;;
      5 ) # Developer tools menu
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Office" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Terminals" \
               "2" "Themes" \
               "3" "" \
               "4" "amd" \
               2>&1)
               case $selection in
               1 ) exit;; #

               * )
                  clear
                  echo "Exited."
                  exit
                  ;;
      6 ) # Multimedia menu
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Multimedia" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Terminals" \
               "2" "Themes" \
               "3" "" \
               "4" "amd" \
               2>&1)
               case $selection in
               1 ) exit;; #

               * )
                  clear
                  echo "Exited."
                  exit
                  ;;
      7 ) # Office menu 
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Office" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Terminals" \
               "2" "Themes" \
               "3" "" \
               "4" "amd" \
               2>&1)
               case $selection in
               1 ) exit;; #

               * )
                  clear
                  echo "Exited."
                  exit
                  ;;
      8 ) # Personal menu
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "Personal choices" \
               --clear \
               --cancel-label "Exit" \
               --menu "Please select:" $HEIGHT $WIDTH 10 \
               "1" "Terminals" \
               "2" "Themes" \
               "3" "" \
               "4" "amd" \
               2>&1)
               case $selection in
               1 ) exit;; #

               * )
                  clear
                  echo "Exited."
                  exit
                  ;;
            esac
         ;;
   esac
done








# forlder creation TODO make this apart of the mian script
dialog --title "Folders"  --backtitle "Desktop server Script"  --yesno "This script recommends you to make normal \nhome directories (like Documents Downloads etc)" 10 60

folders=$?




case $folders in
   0) mkdir Desktop Documents Downloads Music Pictures Videos Public && echo "forlders made";; #yes
   1) exit;; #no
   255) exit;; #exit
esac



# pakege notes
# deb-get, 