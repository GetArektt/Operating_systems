#!/bin/bash
function ending() {
    rm  /tmp/sysopy/*.txt
    rm  /tmp/sysopy/fifo*
    exit
}

trap ending SIGINT
if (( `ls /tmp | grep sysopy | wc -l` == 0 )); then
    mkdir /tmp/sysopy
fi

mkfifo /tmp/sysopy/fifo1 2>/dev/null
mkfifo /tmp/sysopy/fifo2 2>/dev/null

pipe_read=/tmp/sysopy/fifo1
pipe_write=/tmp/sysopy/fifo2

touch log1.txt
touch log2.txt

chmod 777 /tmp/sysopy/*

while true;
do
    input=""
    read -t 1 input
    if [[ $input != '' ]]
    then
        echo $input > $pipe_write
    fi
    timeout 1 cat $pipe_read > log1.txt
    mess1=`cat log1.txt`
    if [[ $mess1 != '' ]]
    then
        echo "<User2> " $mess1
    fi

done
trap echo "SIGINT" SIGINT
exit
