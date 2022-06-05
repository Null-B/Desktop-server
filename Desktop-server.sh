#!/bin/bash

#todo list
# make good instrucions for online and offline users




echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗     ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ";
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ";
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝    ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    ";
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ";
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║         ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ";
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ";
echo "                                                                                                                   ";
echo "                                                                                                                   ";
echo "                                                                                                                   ";

cd ~

# first info message for sudo prems
dialog --title "Information about the script" --pause "Welcome to the Desktop-server script! \nlet me explain the script dose \nso this script will run through some menus to install and costing your machine \nvery simple" 12 60 20;

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
      1 ) 
         dialog --title "You migth not need to look at this section info" --infobox "Amd drives are automatically install on most ubuntu systems only install something here if you need it" 10 60; sleep 5;
         # Drives menu
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
                     "2" "470 series e.g(RTX 3050, RTX 3070/Ti)" \
                     "3" "390 series e.g(older than GTX 1080/Ti, Quadro Series and more)" \
                     "4" "340 series e.g(older than GTX 1080/Ti 9/8/100 Series and more)" \
                     2>&1)
                  esac

                  1 )
                     # sudo ubuntu-drivers install
                     esac
                  ;;
                  
                  2) 
                     #sudo apt install nvidia-driver-470 nvidia-dkms-470
                     esac
                  ;;
                  
                  3 )
                     #sudo apt install nvidia-driver-390 nvidia-dkms-390
                     esac
                  ;;
                  
                  4 )
                     #sudo apt install nvidia-driver-340 nvidia-dkms-340
                     esac
                  ;;
                  
               2 )
                  #sudo apt install xserver-xorg-video-nouveau
                  dialog --title "Selection Complete" --infobox "Your selection complete" 10 60;sleep 1;
                  ;;

               3 ) lshw -c video
                  dialog --title "To be complete" --infobox "Sadly our script has not incorporated Intel drivers yet. But if you do have a intel cpu with integrated graphics you can do \"lshw -c video\" affter." 10 60; sleep 5;

                  dialog --title "Desktop server Script"  --backtitle "What you could do"  --yesno "Ubuntu can run a autodetection and maybe find them. Do you want to run it?" 10 60;

                  intel_drives_auto=$?
                  ;;

               4 )    
                  dialog --title "You migth not need to look at this section" --infobox "Amd drives are automatically install on most ubuntu systems only install something here if you need it" 10 60; sleep 5;
                  sudo lshw -c video ; sleep 5;

                  while true; do
                  exec 2>&1
                  selection=$(dialog \
                     --backtitle "Desktop server Script" \
                     --title "Drives" \
                     --clear \
                     --cancel-label "Exit" \
                     --menu "Please select:" $HEIGHT $WIDTH 10 \
                     "1" "Auto-detect and install" \
                     "2" "PPA amd drives" \
                     2>&1)
                  esac

                  1 )
                     # sudo ubuntu-drivers install
                  ;;

                  2 )
                     #sudo add-apt-repository ppa:oibaf/graphics-drivers
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
               "1" "Sddm (Kde)" \
               "2" "GDM" (Gnome) \
               "3" "ligthdm (Not specified)" \
               "4" "Ly (indipent)" \
               2>&1)

               case $selection in
               1 ) 
                  sudo apt install sddm
                  sudo systemctl enable sddm.service
                  
                  dialog --title "Install complete" --infobox "Done" 5 30; sleep 2;
                  ;;

               2 )
                  sudo apt install gdm
                  sudo systemctl enable gdm.service
                  
                  dialog --title "Install complete" --infobox "Done" 5 30; sleep 2;
                  ;;
               
               3 )
                  sudo apt install lightdm
                  sudo systemctl enable lightdm.service
                  
                  dialog --title "Install complete" --infobox "Done" 5 30; sleep 2;
                  ;;

               4 )
                  sudo apt install build-essential libpam0g-dev libxcb-xkb-dev
                  git clone --recurse-submodules https://github.com/nullgemm/ly
                  cd ly
                  make
                  sudo make run
                  sudo make install
                  cd ~

                  sudo systemctl enable ly.service
                  
                  dialog --title "Install complete" --infobox "Done" 5 30; sleep 2;
                  ;;
               ;;

               sudo systemctl set-default graphical.target

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
                  onoff=on
                  cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose the WMs to install:  (use spacebar to select)' 0 0 0)
                  load-dialog () {
                     options=(
                           "1" "I3" $onoff
                           "1" "I3-gaps" $onoff
                           "2" "Awesome WM" $onoff
                           "3" "bspwm" $onoff
                           "4" "Qtile" $onoff
                     )
                     choices=$("${cmd[@]}" "${options[@]}")
                  }
                  load-dialog
                  exit_code="$?"
                  while [[ $exit_code -ne 0 ]]; do
                  case $exit_code in
                     1) clear; onoff=off; load-dialog;;
                     3) clear; onoff=on; load-dialog;;
                  esac
                  exit_code="$?"
                  done
                  clear
                  for choice in $choices
                  do
                     case $choice in

                        #try the configs of Arco linux
                        1) 

                           sudo apt install i3
                           cd ~/Desktop-server/configs/i3
                           FILE=~/.config/i3/config
                           if test -f "$FILE"; then
                              rm ~/.config/i3/config
                           fi
                           mv cofig i3status.conf ~/.config/i3

                           #big riminder that these do not have backrounds so use nitrgone to set them
                           #make a galery of photos
                        ;;

                        2) #FUCKING SUPER HARD TODO
                           # first use airbender i3-gaps and then cppy and make it || or just the ppa
                           # then install i3 and somehow make it work
                           # coppy the configs and do the same as above

                           cd ~/Desktop-server/configs/i3-gaps
                           FILE=~/.config/i3/config
                           if test -f "$FILE"; then
                              rm ~/.config/i3/config
                           fi
                           mv cofig i3status.conf ~/.config/i3
                        ;;

                        # Awesome WM
                        3) 
                           sudo apt install awesome


                        ;;

                        # bspwm
                        4) 
                           sudo apt install bspwm sxhkd
                           #add confis 
                        ;;

                        # Qtile
                        5) 
                           sudo apt install python-gobject python-dbus python3-pip python3
                           pip3 install xcffib
                           pip3 install --no-cache-dir cairocffi
                           pip3 install qtile
                           #add costime config
                        ;;

                     esac
                  done ;; 

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
                     sudo apt install meta-kde 

                     # pop up box info
                     ;;

                  2) 
                     sudo apt install kde-plasma-desktop

                     # pop up box info
                     ;;

                  3) 
                     sudo apt install vanilla-gnome-desktop
                     # pop up box info
                     ;;


                  4)
                     sudo apt install lxde
                     # pop up box info
                     ;; 

                  5) 
                     sudo apt install lxqt lxqt-core
                     # pop up box info
                     ;;

                  6)
                     sudo apt install mate-desktop-environment
                     # pop up box info 
                     #add a option for the meta and code apps for these
                     ;;

                  7) 
                     sudo at install cinnamon-desktop
                     # pop up box info
                     ;;

                  8) 
                     sudo apt install budgie-desktop
                     # pop up box info
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
               "1" "" \
               "2" "" \
               "3" "" \
               "4" "" \
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
               "1" "" \
               "2" "" \
               "3" "" \
               "4" "" \
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
               1 )                   
                  onoff=on
                  cmd=(dialog --output-fd 1 --separate-output --extra-button --extra-label 'Select All' --cancel-label 'Select None' --checklist 'Choose the tools to install:  use space to select' 0 0 0)
                  load-dialog () {
                     options=(
                                 1 'Option 1' $onoff
                                 2 'Option 2' $onoff
                                 3 'Option 3' $onoff
                                 4 'Option 4' $onoff
                                 5 'Option 5' $onoff
                                 6 'Option 6 (Depends Option 5)' $onoff
                                 7 'Option 7' $onoff
                                 8 'Option 8' $onoff
                     )
                     choices=$("${cmd[@]}" "${options[@]}")
                  }
                  load-dialog
                  exit_code="$?"
                  while [[ $exit_code -ne 0 ]]; do
                  case $exit_code in
                     1) clear; onoff=off; load-dialog;;
                     3) clear; onoff=on; load-dialog;;
                  esac
                  exit_code="$?"
                  done
                  clear
                  for choice in $choices
                  do
                     case $choice in
                        1) echo ;;
                        2) echo 'Second Option';;
                        3) echo 'Third Option';;
                        4) echo 'Fourth Option';;
                        5) echo 'Fifth Option';;
                        6) echo 'Sixth Option';;
                        7) echo 'Seventh Option';;
                        8) echo 'Eighth Option';;
                     esac
                  done ;; #

               * )
                  clear
                  echo "Exited."
                  exit
                  ;;
                  # openrazer-meta meta pack for raver KUR
            esac
         ;;
   esac
done





case $intel_drives_auto
   0) echo "contuned";; #yes
   1) break;; #no
   255) break;; #exit
esac


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
