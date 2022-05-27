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
      "3" "" \
      "4" "" \
      "5" "" \
      "6" "" \
      "7" "" \
      2>&1 1>&3)
   
   # just need to exit the script not very inportant than the rest
   exit_status=$?
   exec 3>&-
   case $exit_status in 
      $DIALOG_CANCEL)
      clear
      echo "Program terminated."
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
      1 ) 
         # case 1 line 48
         # first selection drives
         while true; do
            exec 2>&1
            selection=$(dialog \
               --backtitle "Desktop server Script" \
               --title "install selection" \
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
                  dialog --title "Desktop Drives" --menu "drives" 20 51 4 "Nvidia-autofind" "uses the u";
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
                  echo "Program terminated."
                  exit
                  ;;
            esac
         ;;
      
      2 )
         # case 2
         echo "test2"
         ;;
      3 )
         echo "test3"
         ;;
      4 )
         echo "test4"
         ;;
      5 )
         echo "test5"
         ;;
      6 )
         echo "test6"
         ;;
      7 )
         echo "test7"
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