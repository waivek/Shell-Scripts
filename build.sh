#!/bin/bash
clear
make $1
echo "Press ENTER to Continue"
read
clear
valgrind ./$1
rm -f $1
