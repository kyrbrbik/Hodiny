#!/bin/bash

while [[ true ]]
do
	date +%T | figlet -f /usr/share/figlet/contributed/banner3.flf | cowsay -n -w
	sleep 1
	clear
done
