#!/bin/bash

katalog=$1
var=$2

ls -lt $katalog | awk -v var="$var" '{if ($5 > var) print $9}' | head -1

