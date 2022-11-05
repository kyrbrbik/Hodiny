#!/bin/bash

while [[ true ]]
do
	date +%T | figlet -f ~/.fonts/banner3.flf | cowsay -n -w
	sleep 1
	clear
done
