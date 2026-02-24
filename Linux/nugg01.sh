#!/bin/bash

# Liest Nummern aus 

read -p "Ordner eingeben " wuff

cd ~/Schule/$wuff

ls > ~/Skripte/olli.txt

while read urgh
do
posa=${#urgh}
posb=$((${#urgh}-2))
echo $urgh  | cut -c$posb-$posa  >> ~/Schule/frischling/pull.txt
done < ~/Skripte/olli.txt

rm ~/Skripte/olli.txt
