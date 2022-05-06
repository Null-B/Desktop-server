#!/bin/bash

echo "██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗     ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ";
echo "██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗    ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ";
echo "██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝    ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    ";
echo "██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝     ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ";
echo "██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║         ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ";
echo "╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝         ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ";
echo "                                                                                                                   ";
echo "                                                                                                                   ";

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


