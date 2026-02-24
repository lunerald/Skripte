#!/bin/bash
# liest Abi-Stichwortliste aus für Datenbank
touch ~/Schule/DB/phobolizerl01.sql
zi=(`wc -l ~/Schule/DB/phobolizerl01.csv`)
j=1776
for ((i=0;i<$zi;i++))
do
 IFS='.' read -r -a wuff 
wort="${wuff[0]}"
for i in "${!wuff[@]}"
do 
if [ $i != 0 ]
then
j=$(($j+1))
echo "($j, \"phfb\", \"${wuff[i]}\", \"${wort}\" ),">>~/Schule/DB/phobolizerl01.sql
fi
done

done < ~/Schule/DB/phobolizerl01.csv


