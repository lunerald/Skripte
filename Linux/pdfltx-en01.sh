#!/bin/bash
# Compiliert alle texDateien

cd /home/arno/Nextcloud/Eigenes/Schule
zi=(`wc -l < ./aelist.txt`)


for ((i=0;i<$zi;i++))
do
IFS='/' read -r -a pfadel 

echo "${pfadel[7]}"


cd ~/${pfadel[3]}/${pfadel[4]}/${pfadel[5]}/${pfadel[6]}/${pfadel[7]}/

pdflatex ${pfadel[8]}

cd /home/arno/Nextcloud/Eigenes/Skripte/Linux
read -p "Press Enter to continue to the next iteration or 'q' to quit: " input < /dev/tty
if [[ $input == 'q' ]]; then
break
fi

done < aelist.txt



