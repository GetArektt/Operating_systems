#!/bin/bash

touch los2.txt
plik="los2.txt"
kom="komenda.txt"
while true 
do
	until [ -f $kom ] && [ ! -f $plik ]; 
	do
		sleep 0.01
	plik_komendy=$(cat "komenda.txt")
	done
	if [ "$plik_komendy" == "stop" ]; 
	then
		echo "Konczenie dzialania"
		exit
	fi
	if [ "$plik_komendy" == "start" ]; 
	then
		random=`expr $RANDOM % 3`
		if [ $random == "0" ] 
		then
			echo "papier" > $plik
		elif [ $random == "1" ] 
		then
			echo "kamien" > $plik
		else
			echo "nozyce" > $plik
		fi
	fi
done
rm los2.txt
