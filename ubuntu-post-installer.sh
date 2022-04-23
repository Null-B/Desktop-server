#!/bin/bash

echo "This script will install and modify files do you want to continue 
(also if you are runing this with sudo do not do continue) [y/n] "

read start
if [ $start = "n" ]
then 
	exit
fi

echo "also if you are useing any server version of a distrobution you migth want to make Normal Home directory folders"
echo "(like Desktop, Downloads etc) [y/N]"

read folds
if [ $folds = "y" ]
then
	mkdir Desktop Documents Downloads Music Pictures Videos Public
fi

sudo apt update && sudo apt upgrade -y

mkdir script

# make a dir for easy clean up

#apps for use
sudo apt install kitty net-tools pamix ncdu feh htop git neofetch timeshift flameshot cmake curl ranger picom dmenu firefox ninja meson -y

# snap
sudo snap install discord mailspring spotify

sudo snap remove firefox

# vscode
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# ufw
sudo ufw enable

# vim 
sudo apt remove vim-tiny

sudo apt install vim
 
### i3-gaps
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \libstartup-notification0-dev libxcb-randr0-dev \libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

cd script
# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile
mkdir -p build && cd build
meson --prefix /usr/local
ninja
sudo ninja install

cd ..

# i3 config
git clone https://github.com/Null-B/dotfiles
cd dotfiles 
mv config /etc/i3

cd ~

### github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt install gh

# telegram desktop
echo "do you want to install telegream desktop?"
echo "y/N"

read answer
if [ $answer = "y" ]
then 
	sudo apt install telegram-desktop
fi

# wallpaypr


# aliasis
# alias cd..="cd .."
# alias cd...="cd../../.."
# alias vi=vim
# alias svi ="sudo vim"
# alias ports="netstat -tul"

sudo apt update && sudo apt upgrade -y

#timeshift backup
echo "do you want to make a backup with timeshift?"
echo "y/N"

read answers
if [ $answers = "y" ]
then 
	sudo timeshift --create
fi

# restart
echo "do you want to reboot now? (i recomend you do so)"
echo "y/N"

read answers
if [ $answers = "y" ]
then 
	reboot -h
fi
