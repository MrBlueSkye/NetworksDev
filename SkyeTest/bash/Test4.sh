#!/usr/bin/env bash

echo Hi, what\'s your name?

read varname
sleep 1
echo Alright $varname, been a while.
sleep 1
echo So what box we configuring?

read device
sleep 1
echo Ahhh, the old $device eh? Classic.
sleep 1
echo So you may as well just let me do it. Enter your commands here with a space between each one, and I\'ll sort you right out.

read config

IFS=',' read -a config <<< "$config"

for ((i=0, j=1; i< ${#config[@]}; i++, j++)); do
   declare "command$j"="${config[$i]}"
done

sleep 2
echo So give this a once over please...
sleep 2
echo "Command 1: ${config[0]}"
echo "Command 2: ${config[1]}"
echo "Command 3: ${config[2]}"
echo "Command 4: ${config[3]}"
sleep 1
command1="${config[0]}"
command2="${config[1]}"
command3="${config[2]}"
command4="${config[3]}"

while true
do
  read -p "This correct bud? (Y/N)" answer
  case $answer in
   [yY]* )echo Cool! So I\'m gonna give you a command. Just paste it right here into your pal NAB and I\'ll get you your output.
        
	sleep 3  
	echo " "
	echo 'clogin -c "'$command1';'$command2';'$command3';'$command4'" '$device''
	echo " "
	   sleep 5
		while true
		do
  			read -p "Is that everything? (Y/N)" finalanswer
  			case $finalanswer in
  			 [yY]* )echo "Sweet! I'm off, catch ya later."
          		 break;;

  			 [nN]* ) sleep 3
   			echo "Damn, I haven't been coded for this situtation. Re-run the Wizard pls."
   			exit;;

  			 * )     echo "Dude, just enter Y or N, please.";;
 			 esac
			 done	
   [nN]* )exit;;

   * )     echo "Dude, just enter Y or N, please.";;
  esac
done
