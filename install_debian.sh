#!/bin/bash
#Rough version
#Need to cleanup output of the commands


#Check and install dependencies

cowsay=$(apt list --installed cowsay | awk 'NR==2{print $1}')

if [[ $cowsay != "cowsay/focal" ]]
then
	read -p "Would you like to install cowsay? (Y/N)" choice
        case "$choice" in
                n|N)
                        echo "Please install cowsay manually"
                        ;;
                y|Y)
                        echo "installing cowsay"
                        sudo apt install cowsay -y
                        ;;
        esac
fi 

figlet=$(apt list --installed figlet | awk 'NR==2{print $1}')

if [[ $figlet != "figlet/focal" ]]
then
	read -p "Would you like to install figlet? (Y/N)" choice
        case "$choice" in
                n|N)
                        echo "Please install figlet manually"
                        ;;
                y|Y)
                        echo "installing figlet"
                        sudo apt install figlet -y
                        ;;
        esac
fi

#Download font

fonts=$(ls ~ -la | grep .fonts | awk -F " " '{print $NF}')

if [[ $fonts != ".fonts" ]]
then
	mkdir ~/.fonts
fi

banner=$(ls -la ~/.fonts/banner3.flf 2>/dev/null | awk -F " " '{print $NF}' | awk -F "/" '{print $NF}')
if [[ $banner != "banner3.flf" ]]; then

cd ~/.fonts
wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz

tar -xf contributed.tar.gz
cp contributed/banner3.flf .
rm -rf contributed
rm -rf contributed.tar.gz

else
	echo "font already present"
fi

