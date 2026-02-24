#!/bin/bash
# liest Stichwortliste aus und beschneidet Dateinamen zu Nummern für Datenbank
touch ~/Schule/DB/chemzerl01.sql
zi=(`wc -l ~/Schule/DB/chemzerl01.csv`)

for ((i=0;i<$zi;i++))
do
 IFS='.' read -r -a wuff 
wort="${wuff[0]}"
for i in "${!wuff[@]}"
do 
pos=$((${#wuff[$i]}-3))
wuff[$i]=${wuff[$i]:$pos}

#echo ${nam[@]:1}
if [ $i != 0 ]
then
echo "( ${wuff[i]}, \"${wort}\" ),">>~/Schule/DB/chemzerl01.sql
fi
done

done < ~/Schule/DB/chemzerl01.csv


