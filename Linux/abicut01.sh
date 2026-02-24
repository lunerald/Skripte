#!/bin/bash
cd ~/Schreibtisch/aphysneu

for ((m=2;m<=14;m++))
do
n=$(($m - 1))
sed -i s/=${m}\"\>${m}\</=${n}\"\>${n}\</g phyli01.html
done
