#!/bin/bash

sudo apt update && sudo apt upgrade -y

#apps for use
sudo apt install kitty net-tools pamix ncdu feh htop git neofetch timeshift flameshot cmake curl -y

# snap
sudo snap install discord mailspring 

# vscode
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# ufw
sudo ufw enable

# vim 
sudo apt uninstall vim-tiny

sudo apt install vim
 
### i3-gaps
cd Downloads

sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \libstartup-notification0-dev libxcb-randr0-dev \libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev

# clone the repository
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

# compile
mkdir -p build && cd build
meson ..
ninja

cd ..

### github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt install gh

############# telegram desktop if
# read -n1 -p "do you want Telegram-Desktop? y/N" doit
# case $doit in
#  y|Y) sudo apt install telegram-desktop;;
#  n|N) break;;
# esac

# wallpaypr
cd Downloads
wget 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/i/b3355004-e447-43d4-8f97-7067752dfe3d/daqy5oc-971fc3f7-e9ee-41ae-b3ad-a2258a11dcdc.jpg/v1/fill/w_1131,h_707,q_70,strp/solid_color_i3wm_wallpapers_by_andreaser_daqy5oc-pre.jpg'
feh --bg-scale solid_color_i3wm_wallpapers_by_andreaser_daqy5oc-pre.jpg
cd ..

# spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update && sudo apt-get install spotify-client




# i3 config
cd /etc/i3
sudo rm config

# pls test the line above

wget 'https://github.com/Null-B/dotfiles/blob/main/config'

# aliasis
alias cd..="cd .."
alias cd...="cd../../.."
alias vi=vim
alias svi ="sudo vim"
alias ports="netstat -tul"
