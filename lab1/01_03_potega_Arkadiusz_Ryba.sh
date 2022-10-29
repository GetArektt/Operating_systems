#!/bin/bash


echo "Wynik: $(($1 ** $2))"


result=1


for (( i=0; i<$2;i++))
do
	result=$(( $result * $1 ))
done

echo "Wynik z loopem: $result"	
