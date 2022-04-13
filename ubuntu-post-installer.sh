#!/bin/bash

sudo apt update && sudo apt upgrade -y

#apps for use
sudo apt install kitty net-tool pamix ncdu feh htop git neofetch timeshift flameshot -y

sudo apt install gdebi-core wget

# snap
sudo snap install discord mailspring

# vscode
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code

# spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt install spotify-client

# ufw
sudo ufw enable

# vim 
sudo apt uninstall vim-tiny

sudo apt install vim
 
# github cli
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt install gh



# aliasis
alias cd..="cd .."
alias cd...="cd../../.."
alias vi=vim
alias svi ="sudo vim"
alias ports="netstat -tul"

