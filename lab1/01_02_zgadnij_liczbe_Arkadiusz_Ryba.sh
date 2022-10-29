#!/bin/bash 

min=$1
max=$2

y=$(($RANDOM%($max-$min+1)+$min))
echo $y
if [[ $max -lt $min ]];
then
	echo "Error"
	exit
fi



for i in {1..10};
do
	echo "Zostalo $(( 11 - $i )) prob"
	read x
	if [[ $x == $y ]];then 
		echo "Udalo ci sie!"
		exit
	elif [[ $x > $y ]];then
		echo "Za duzo"
	else 
		echo "Za malo"
	fi
	if [[ $i == 10 ]];then
	echo "brak prob"
	exit
	fi
done
