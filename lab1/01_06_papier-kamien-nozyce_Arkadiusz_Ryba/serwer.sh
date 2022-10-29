#!/bin/bash

i=0
gracz1=0
gracz2=0

rm gra.log
rm komenda.txt


while [ $i -lt $1 ]; 
do
	echo "start" > "komenda.txt"
	until [ -f 'los1.txt' ] && [ -f 'los2.txt' ]; do
		sleep 0.01
	done
    
    rm komenda.txt
	sleep 0.1
	los1=$(cat los1.txt)
	los2=$(cat los2.txt)

	if [ $los1 == $los2 ]; 
    then
		echo "Remis" >> "gra.log"
	elif ([ $los1 == "kamien" ] && [ $los2 == "nozyce" ]) || ([ $los1 == "papier" ] && [ $los2 == "kamien" ]) || ([ $los1 == "nozyce" ] && [ $los2 == "papier" ]); then
		gracz1=$(($gracz1 + 1))
		echo "Wygrał gracz 1: $los1 $los2" >> "gra.log"
	else
		gracz2=$(($gracz2 + 1))
		echo "Wygrał gracz 2: $los1 $los2" >> "gra.log"
	fi

	rm los1.txt
	rm los2.txt
	i=$(($i + 1))
done

sleep 1
echo "Wygrane gracza 1: $gracz1"
echo "Wygrane gracza 2: $gracz2"

echo "stop" > "komenda.txt"

rm komenda.txt
