#!/bin/bash
clear
make $1
echo "Press ENTER to Continue"
read
clear
valgrind ./$*
rm -f $1
