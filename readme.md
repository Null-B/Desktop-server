# Desktop install Script 
THIS IS STILL IN TESTING IT IS VERY UNSTABEL RUN AT YOUR OWN RISK
## What is this script? 
This is a script that is made for users that are not satisfeid with the ubuntu spins or do not want to go throuth the hasel of installing a headless version of ubuntu and instaling and configuring the  base pakeges on thier own.

Basicly this is a fast way to install a costimezd version of Ubuntu  
## The main goal with this script. 
The main goal of this script if to help new users and long time linux users that want a Ubuntu distrobution that is made for therir teaste. For new users this is a great start to get in to more coplex mechanics of linux without needing to switch distrobutions.
## How to install and use?
[More information and how the script works on our wiki]()  
You install requirements manually or use the autorun.sh script.
That will install and execute the script.  
If you chose to do the requirements install manualy. You will frist need to clone the repository with this comand:
```
> git clone https://github.com/Null-B/dotfiles
```
Now you can cd into the repository and run the script with this comand:
```
> cd dotfiles
> chmod +x requirements.sh
> ./requirements.sh
```
This will make the script executeble and will install all the packages that are needed for the script to work.  
Then you can make the main scrip executeble and run it:
```
> chmod +x ubuntu-desktop-install.sh
> ./ubuntu-desktop-install.sh
```
You will be presented with a blue dialog screen. More on the main install process can be found on the wiki.
