#bin/bash
git clone https://github.com/Null-B/dotfiles #this may change
cd dotfiles

sudo apt update && sudo apt install dialog git 
echo "done"

chmod +x Desktop-server.sh
./Desktop-server.sh