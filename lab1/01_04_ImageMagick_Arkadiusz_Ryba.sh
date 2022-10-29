#!/bin/bash

filename=$1
logo=$2
x=$3
y=$4



composite -geometry $xx$y $logo $filename newfile.png
