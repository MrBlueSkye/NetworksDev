#!/usr/bin/env bash

echo Hi, what\'s your name?

read varname

echo Alright $varname, been a while.
echo So what box we configuring?

read device

echo Ahhh, the old $device eh? Classic.

echo So you may as well just let me do it. Enter your commands here with a space between each one, and I\'ll sort you right out.

read command1 command2 command3 command4 command5 command6

echo So give this a once over please...
echo command1
echo command2
echo command3
echo command4
echo command5
echo command6

while true
do

  read -p "This correct bud? " answer


  case $answer in
   [yY]* )echo Cool! So I\'m gonna give you a command. Just paste it right here into your pal NAB and I\'ll get you your output.
          echo "clogin -c "$command1;$command2;$command3;$command4;$command5;$command6" $device 2>&1 Wizard_Output"


           echo "Sweet, catch ya later."
           break;;

   [nN]* ) exit;;

   * )     echo "Dude, just enter Y or N, please.";;
  esac
done

