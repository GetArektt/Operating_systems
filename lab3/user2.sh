#!/bin/bash

pipe_read=/tmp/sysopy/fifo2
pipe_write=/tmp/sysopy/fifo1

while true;
do
    input=""
    read -t 1 input
    if [[ $input != '' ]]
    then
        echo $input > $pipe_write
    fi
    timeout 1 cat $pipe_read > log2.txt
    mess2=`cat log2.txt`
    if [[ $mess2 != '' ]]
    then
        echo "<User1> " $mess2
    fi
done

exit
