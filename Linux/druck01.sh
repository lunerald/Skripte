#!/bin/bash

feld=("m8gegeL017" "m8hypL019" "m9nopL015" "m9aparL016" "m10potiL021" "m10efuL018" "m10sifuL014" "m11efunL022" "m11elleL020" "m11lnfuL023")

for blatt in "${feld[@]}"
do
read -p "$blatt wieviel?" anz

cd /media/arno/SD/Schule/mazlbackup/$blatt

num=${blatt##*L} 

if [ $anz != 0 ] 
then
lpr -# $anz aa$num.pdf 
fi



done

