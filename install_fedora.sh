#!/bin/bash
#Rough version
#Need to cleanup output of the commands


#Check and install dependencies

cowsay=$(dnf list installed cowsay 2>/dev/null | awk 'NR==2{print $1}')

if [[ $cowsay != "cowsay.noarch" ]]
then
	read -p "Would you like to install cowsay? (Y/N)" choice
	case "$choice" in
		n|N)
			echo "Please install cowsay manually"
			;;
		y|Y)
			echo "installing cowsay"
			sudo dnf install cowsay -y
			;;
	esac
fi 

figlet=$(dnf list installed figlet 2>/dev/null | awk 'NR==2{print $1}')

if [[ $figlet != "figlet.x86_64" ]]
then
	read -p "Would you like to install figlet? (Y/N)" choice
        case "$choice" in
                n|N)
                        echo "Please install figlet manually"
                        ;;
                y|Y)
                        echo "installing figlet"
                        sudo dnf install figlet -y
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

	wget=$(dnf list installed wget 2>/dev/null | awk 'NR==2{print $1}')
	curl=$(dnf list installed curl 2>/dev/null | awk 'NR=2{print $1}')

	if [[ $wget = "wget.x86_64" ]]; then
		cd ~/.fonts
		wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz
	elif [[ $curl = "curl.x86_64" ]]; then
		cd ~/.fonts
		curl ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz --output contributed.tar.gz
	else
		sudo dnf install wget -y
		cd ~/.fonts
        	wget ftp://ftp.figlet.org/pub/figlet/fonts/contributed.tar.gz
	fi

	tar -xf contributed.tar.gz
	cp contributed/banner3.flf .
	rm -rf contributed
	rm -rf contributed.tar.gz
else
	echo "font already present"
fi
