#!/bin/bash

file="vpn.log"

if [ ! -e "$file" ]; then
	touch $file
fi

if [ ! -w "$file" ]; then
    echo "Nie mozna pisac do pliku $file"
    exit 
fi

SECONDS=0
sudo killall openvpn

echo -e "\nNawiazanie polaczenia" `date` >> vpn.log
echo -n "Opening VPN: "
sudo openvpn /etc/openvpn/easy-rsa/VPN-AGH.2023.ovpn
 while [ `ifconfig | grep tun0 | wc -l` -eq 1 ]
 do 
 	echo -en "."
 	sleep 10
done


echo "Eleganckie konczenie polaczenia..."
echo "Zakoczono polaczenie" `date` >> vpn.log
duration=$SECONDS
echo "Czas trwania polaczenia: $(($duration / 60)) minut" >> vpn.log
sudo killall openvpn
