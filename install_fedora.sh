#!/bin/bash
#Rough version
#Need to cleanup output of the commands


#Check and install dependencies

cowsay=$(dnf list installed cowsay | awk 'NR==2{print $1}')

if [[ $cowsay != "cowsay.noarch" ]]
then
	echo "installing cowsay"
	sudo dnf install cowsay -y
fi 

figlet=$(dnf list installed figlet | awk 'NR==2{print $1}')

if [[ $figlet != "figlet.noarch" ]]
then
        echo "installing figlet"
        sudo dnf install figlet -y
fi

#Download font

cd ~/.fonts
wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz
tar -xf contributed.tar.gz
cp contributed/banner3.flf .
rm -rf contributed
rm -rf contributed.tar.gz
