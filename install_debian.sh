#!/bin/bash
#Rough version
#Need to cleanup output of the commands


#Check and install dependencies

cowsay=$(apt list --installed cowsay | awk 'NR==2{print $1}')

if [[ $cowsay != "cowsay/focal" ]]
then
	echo "installing cowsay"
	sudo apt install cowsay -y
fi 

figlet=$(apt list --installed figlet | awk 'NR==2{print $1}')

if [[ $figlet != "figlet/focal" ]]
then
        echo "installing figlet"
        sudo apt install figlet -y
fi

#Download font

fonts=$(ls -la | grep .fonts | awk '{print $9}')

if [[ $fonts != ".fonts" ]]
then
	mkdir ~/.fonts
fi

cd ~/.fonts
wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz
tar -xf contributed.tar.gz
cp contributed/banner3.flf .
rm -rf contributed
rm -rf contributed.tar.gz
