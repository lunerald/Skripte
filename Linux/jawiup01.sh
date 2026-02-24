#!/bin/bash
#  Datenbank
touch ~/Schule/DB/jawiup01.sql

zi=(`wc -l ~/Schule/DB/pholidb01.csv`)

for ((i=0;i<$zi;i++))
do

IFS='.' read -r -a wuff

for j in "${!wuff[@]}"
do 
if [ $j != 0 ]
then
echo "UPDATE \`Stiwabi01\` SET \`Oberbegriff\`=\"${wuff[0]}\" WHERE \`Stichwort\`=\"${wuff[$j]}\" AND \`Fach\`=\"phfb\";" >> ~/Schule/DB/jawiup01.sql
fi
done
done < ~/Schule/DB/pholidb01.csv


